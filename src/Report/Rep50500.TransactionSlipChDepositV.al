
Report 50500 "Transaction Slip - ChDeposit V"
{
    RDLCLayout = 'Layouts/TransactionSlip-ChDepositV.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Transactions; Transactions)
        {
            DataItemTableView = sorting(No);
            RequestFilterFields = No;
            column(Transactions_Type; Transactions.Type)
            {
            }
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(CompanyInfo_Address; CompanyInfo.Address)
            {
            }
            column(Transactions_Amount; Transactions.Amount)
            {
            }
            column(MemberName_Transactions; Transactions."Member Name")
            {
            }
            column(Transactions__Cheque_No_; Transactions."Cheque No")
            {
            }
            column(Transactions__Staff_Payroll_No_; Transactions."Staff/Payroll No")
            {
            }
            column(NumberText_1_; NumberText[1])
            {
            }
            column(Transactions_Transactions__Branch_Refference_; Transactions."Branch Refference")
            {
            }
            column(Transactions__Account_Name_; Transactions."Account Name")
            {
            }
            column(Transactions__Account_No_; Transactions."Account No")
            {
            }
            column(Transactions_Transactions_Cashier; Transactions.Cashier)
            {
            }
            column(Transactions_Transactions__Transaction_Time_; Transactions."Transaction Time")
            {
            }
            column(Transactions__Transaction_Date_; Format("Transaction Date"))
            {
            }
            column(Transactions_No; Transactions.No)
            {
            }
            column(Transactions_Transactions_Remarks; Transactions.Remarks)
            {
            }
            column(Amount_DepositedCaption; Amount_DepositedCaptionLbl)
            {
            }
            column(Transactions__Cheque_No_Caption; FieldCaption("Cheque No"))
            {
            }
            column(Staff_Payroll_No_Caption; Staff_Payroll_No_CaptionLbl)
            {
            }
            column(Account_Name_Caption; Account_Name_CaptionLbl)
            {
            }
            column(Account_No_Caption; Account_No_CaptionLbl)
            {
            }
            column(TellerCaption; TellerCaptionLbl)
            {
            }
            column(Time_Caption; Time_CaptionLbl)
            {
            }
            column(Date_Caption; Date_CaptionLbl)
            {
            }
            column(Trans_No_Caption; Trans_No_CaptionLbl)
            {
            }
            column(Deposited_By_Caption; Deposited_By_CaptionLbl)
            {
            }
            column(Transactions_Transaction_Type; Transactions."Transaction Type")
            {
            }
            column(ValueDate; Format(Transactions."Expected Maturity Date"))
            {
            }
            dataitem("Transaction Charges"; "Transaction Charges")
            {
                DataItemLink = "Transaction Type" = field("Transaction Type");

                column(Transaction_Charges_Description; "Transaction Charges".Description)
                {
                }
                column(Transaction_Charges__Charge_Amount_; "Transaction Charges"."Charge Amount")
                {
                }
                column(Transaction_Charges_Transaction_Type; "Transaction Charges"."Transaction Type")
                {
                }
                column(Transaction_Charges_Charge_Code; "Transaction Charges"."Charge Code")
                {
                }
            }
            dataitem("Receipt Allocation"; "Receipt Allocation")
            {
                DataItemLink = "Document No" = field(No);

            }
            trigger OnPreDataItem();
            begin
                CompanyInfo.Get();
                CompanyInfo.CalcFields(CompanyInfo.Picture);
            end;

            trigger OnAfterGetRecord();
            begin
                ATMBalance := 0;
                //"Transactions 1".CALCFIELDS("Transactions 1"."Book Balance");
                LoanGuaranteed := 0;
                UnClearedBalance := 0;
                TotalGuaranted := 0;
                TransactionCharges.Reset;
                TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
                TCharges := 0;
                AvailableBalance := 0;
                MinAccBal := 0;
                //CALCFIELDS("Book Balance");
                AccountTypes.Reset;
                AccountTypes.SetRange(AccountTypes.Code, "Account Type");
                if AccountTypes.Find('-') then begin
                    MinAccBal := AccountTypes."Minimum Balance";
                    FeeBelowMinBal := AccountTypes."Fee Below Minimum Balance";
                end;
                if Posted = false then begin
                    if TransactionCharges.Find('-') then
                        repeat
                            ////////
                            if TransactionCharges."Use Percentage" = true then begin
                                if TransactionCharges."Percentage of Amount" = 0 then
                                    Error('Percentage of amount cannot be zero.');
                                //USE BOOK BALANCE FOR ESTIMATING PERCENTAGE OF AMOUNT
                                TCharges := TCharges + (TransactionCharges."Percentage of Amount" / 100) * "Book Balance";
                                //TCharges:=TCharges+(TransactionCharges."Percentage of Amount"/100)*Amount;
                            end
                            else begin
                                TCharges := TCharges + TransactionCharges."Charge Amount";
                            end;
                        /////////
                        //TCharges:=TCharges+TransactionCharges."Charge Amount";
                        until TransactionCharges.Next = 0;
                    TransactionCharges.Reset;
                    ///// CHECK LAST WITHDRAWAL DATE AND FIND IF CHARGE IS APPLICABLE AND CHARGE
                    IntervalPenalty := 0;
                    Members.Reset;
                    if Members.Get("Account No") then begin
                        if Members.Status <> Members.Status::Deceased then begin
                            if Type = 'Withdrawal' then begin
                                AccountTypes.Reset;
                                AccountTypes.SetRange(AccountTypes.Code, "Account Type");
                                if AccountTypes.Find('-') then begin
                                    if CalcDate(AccountTypes."Withdrawal Interval", Members."Last Withdrawal Date") > Today then begin
                                        IntervalPenalty := AccountTypes."Withdrawal Penalty";
                                    end;
                                end;
                            end;
                        end;
                    end;
                    //////////////
                    /////////////
                    //FIXED DEPOSIT
                    ChargesOnFD := 0;
                    Members.Reset;
                    if Members.Get("Account No") then begin
                        AccountTypes.Reset;
                        if AccountTypes.Get(Members."Account Type") then begin
                            if AccountTypes."Fixed Deposit" = true then begin
                                if Members."Expected Maturity Date" > Today then begin
                                    ChargesOnFD := AccountTypes."Charge Closure Before Maturity";
                                end;
                            end;
                        end;
                    end;
                    Members.Reset;
                    ///////////
                end;
                //UNCLEARED CHEQUES
                chqtransactions.Reset;
                chqtransactions.SetRange(chqtransactions."Account No", "Account No");
                chqtransactions.SetRange(chqtransactions.Deposited, true);
                chqtransactions.SetRange(chqtransactions."Cheque Processed", false);
                if chqtransactions.Find('-') then begin
                    repeat
                        TotalUnprocessed := TotalUnprocessed + chqtransactions.Amount;
                    until chqtransactions.Next = 0;
                end;
                //ATM BALANCE
                AccountHolders.Reset;
                AccountHolders.SetRange(AccountHolders."No.", "Account No");
                if AccountHolders.Find('-') then begin
                    //AccountHolders.CALCFIELDS(AccountHolders."ATM Transactions");
                    ATMBalance := AccountHolders."ATM Transactions";
                end;
                if LoanGuaranteed < 0 then
                    LoanGuaranteed := 0;
                if UnClearedBalance < 0 then
                    UnClearedBalance := 0;
                AccountTypes.Reset;
                if AccountTypes.Get("Account Type") then begin
                    if AccountTypes."Fixed Deposit" = false then begin
                        if "Book Balance" < MinAccBal then
                            AvailableBalance := "Book Balance" - FeeBelowMinBal - TCharges - IntervalPenalty - MinAccBal - TotalUnprocessed - ATMBalance
                        else
                            AvailableBalance := "Book Balance" - TCharges - IntervalPenalty - MinAccBal - TotalUnprocessed - ATMBalance;
                    end else
                        AvailableBalance := "Book Balance" - TCharges - ChargesOnFD;
                end;
                //AvailableBalance:=AvailableBalance-Transactions.Amount;
                if Account.Get(Transactions."Account No") then begin
                    Account.CalcFields(Account."Balance (LCY)");
                    AvailableBalance := Account."Balance (LCY)" - 1000;
                end;
                vatTotalHolder := Transactions.Amount;
                TillNo := '';
                TellerTill.Reset;
                TellerTill.SetRange(TellerTill."Cashier ID", Transactions.Cashier);
                if TellerTill.Find('-') then begin
                    TillNo := TellerTill."No.";
                end;
                CheckReport.InitTextVariable();
                CheckReport.FormatNoText(NumberText, Amount, ' ');
            end;

        }
    }

    requestpage
    {


        SaveValues = false;
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';

                }
            }
        }

        actions
        {
        }
        trigger OnOpenPage()
        begin

        end;
    }

    trigger OnInitReport()
    begin
        ;


    end;

    trigger OnPostReport()
    begin
        ;

    end;

    trigger OnPreReport()
    begin
        ;

    end;

    var
        Account: Record Vendor;
        LoanBalance: Decimal;
        AvailableBalance: Decimal;
        UnClearedBalance: Decimal;
        LoanSecurity: Decimal;
        LoanGuaranteed: Decimal;
        GenJournalLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        GLPosting: Codeunit "Gen. Jnl.-Post Line";
        window: Dialog;
        Members: Record Vendor;
        TransactionTypes: Record "Transaction Type";
        TransactionCharges: Record "Transaction Charges";
        TCharges: Decimal;
        LineNo: Integer;
        AccountTypes: Record "Account Types-Saving Products";
        GenLedgerSetup: Record "General Ledger Setup";
        MinAccBal: Decimal;
        FeeBelowMinBal: Decimal;
        AccountNo: Code[30];
        NewAccount: Boolean;
        CurrentTellerAmount: Decimal;
        TellerTill: Record "Bank Account";
        IntervalPenalty: Decimal;
        StandingOrders: Record "Standing Orders";
        AccountAmount: Decimal;
        STODeduction: Decimal;
        Charges: Record Charges;
        "Total Deductions": Decimal;
        STODeductedAmount: Decimal;
        NoticeAmount: Decimal;
        AccountNotices: Record "Account Notices";
        Cust: Record "Members Register";
        AccountHolders: Record Vendor;
        ChargesOnFD: Decimal;
        TotalGuaranted: Decimal;
        VarAmtHolder: Decimal;
        vatTotalHolder: Decimal;
        chqtransactions: Record Transactions;
        TotalUnprocessed: Decimal;
        ATMBalance: Decimal;
        TillNo: Code[20];
        CompanyInfo: Record "Company Information";
        Amount_DepositedCaptionLbl: label 'Amount Deposited';
        Staff_Payroll_No_CaptionLbl: label 'Staff/Payroll No:';
        Account_Name_CaptionLbl: label 'Account Name:';
        Account_No_CaptionLbl: label 'Account No:';
        TellerCaptionLbl: label 'Teller';
        Time_CaptionLbl: label 'Time:';
        Date_CaptionLbl: label 'Date:';
        Trans_No_CaptionLbl: label 'Trans No.';
        Deposited_By_CaptionLbl: label 'Deposited By:';
        NumberText: array[2] of Text[80];
        LastFieldNo: Integer;
        CheckReport: Report Check;

    procedure CalAvailableBal()
    begin
        ATMBalance := 0;
        TCharges := 0;
        AvailableBalance := 0;
        MinAccBal := 0;
        TotalUnprocessed := 0;
        IntervalPenalty := 0;
        if Account.Get(Transactions."Account No") then begin
            Account.CalcFields(Account.Balance);
            AccountTypes.Reset;
            AccountTypes.SetRange(AccountTypes.Code, Transactions."Account Type");
            if AccountTypes.Find('-') then begin
                MinAccBal := AccountTypes."Minimum Balance";
                FeeBelowMinBal := AccountTypes."Fee Below Minimum Balance";
                //Check Withdrawal Interval
                if Account.Status <> Account.Status::Deceased then begin
                    if Transactions.Type = 'Withdrawal' then begin
                        AccountTypes.Reset;
                        AccountTypes.SetRange(AccountTypes.Code, Transactions."Account Type");
                        if Account."Last Withdrawal Date" <> 0D then begin
                            if CalcDate(AccountTypes."Withdrawal Interval", Account."Last Withdrawal Date") > Today then
                                IntervalPenalty := AccountTypes."Withdrawal Penalty";
                        end;
                    end;
                    //Check Withdrawal Interval
                    //Fixed Deposit
                    ChargesOnFD := 0;
                    if AccountTypes."Fixed Deposit" = true then begin
                        if Account."Expected Maturity Date" > Today then
                            ChargesOnFD := AccountTypes."Charge Closure Before Maturity";
                    end;
                    //Fixed Deposit
                    //Current Charges
                    TransactionCharges.Reset;
                    TransactionCharges.SetRange(TransactionCharges."Transaction Type", Transactions."Transaction Type");
                    if TransactionCharges.Find('-') then begin
                        repeat
                            if TransactionCharges."Use Percentage" = true then begin
                                TransactionCharges.TestField("Percentage of Amount");
                                TCharges := TCharges + (TransactionCharges."Percentage of Amount" / 100) * Transactions."Book Balance";
                            end else begin
                                TCharges := TCharges + TransactionCharges."Charge Amount";
                            end;
                        until TransactionCharges.Next = 0;
                    end;
                    TotalUnprocessed := Account."Uncleared Cheques";
                    ATMBalance := Account."ATM Transactions";
                    //FD
                    if AccountTypes."Fixed Deposit" = false then begin
                        if Account.Balance < MinAccBal then
                            AvailableBalance := Account.Balance - FeeBelowMinBal - TCharges - IntervalPenalty - MinAccBal - TotalUnprocessed - ATMBalance
                        else
                            AvailableBalance := Account.Balance - TCharges - IntervalPenalty - MinAccBal - TotalUnprocessed - ATMBalance;
                    end else begin
                        AvailableBalance := Account.Balance - TCharges - ChargesOnFD;
                    end;
                end;
                //FD
            end;
        end;
    end;


    var
}