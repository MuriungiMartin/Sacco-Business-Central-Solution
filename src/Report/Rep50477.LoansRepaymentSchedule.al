#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // 

Report 50477 "Loans Repayment Schedule"
{
    RDLCLayout = 'Layouts/LoansRepaymentSchedule.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Loans Register"; "Loans Register")
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Loan  No.", "Issued Date";

            column(Loans_Loans__Issued_Date_; "Loans Register"."Issued Date")
            {
            }
            column(Loans_Installments__Grace_Period___Principle__M__; "Loans Register".Installments + "Grace Period - Principle (M)")
            {
            }
            column(Loans_Loans_Interest; "Loans Register".Interest)
            {
                DecimalPlaces = 2 : 2;
            }
            column(EmployerName; EmployerName)
            {
            }
            column(Loans_Loans__Approved_Amount_; "Loans Register"."Approved Amount")
            {
            }
            column(Loans_Loans__Loan_Product_Type_Name_; "Loans Register"."Loan Product Type Name")
            {
            }
            column(Loans_Loans__Loan__No__; "Loans Register"."Loan  No.")
            {
            }
            column(Loans_Loans__Client_Name_; "Loans Register"."Client Name")
            {
            }
            column(Loans_Loans__Client_Code_; "Loans Register"."Client Code")
            {
            }
            column(Loans__Repayment_Method_; "Loans Register"."Repayment Method")
            {
            }
            column(Intallments__Months_Caption; Intallments__Months_CaptionLbl)
            {
            }
            column(Disbursment_DateCaption; Disbursment_DateCaptionLbl)
            {
            }
            column(Current_InterestCaption; Current_InterestCaptionLbl)
            {
            }
            column(Loan_AmountCaption; Loan_AmountCaptionLbl)
            {
            }
            column(Loan_ProductCaption; Loan_ProductCaptionLbl)
            {
            }
            column(Loan_No_CaptionLbl; Loan_No_CaptionLbl)
            {
            }
            column(Account_No_Caption; Account_No_CaptionLbl)
            {
            }
            column(EmployerCode_Loans; "Loans Register"."Employer Code")
            {
            }
            column(Loans__Repayment_Method_Caption; FieldCaption("Repayment Method"))
            {
            }
            column(Loans_NewRepaymentPeriod; "Loans Register"."New Repayment Period")
            {
            }
            column(INST; INST)
            {
            }
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(CompanyInfo_Address; CompanyInfo.Address)
            {
            }
            column(CompanyInfo__Phone_No__; CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfo__E_Mail_; CompanyInfo."E-Mail")
            {
            }
            column(CompanyInfo_City; CompanyInfo.City)
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            dataitem("Loan Repayment Schedule"; "Loan Repayment Schedule")
            {
                DataItemLink = "Loan No." = field("Loan  No.");
                DataItemTableView = sorting("Loan No.", "Member No.", "Repayment Date") where("Reschedule No" = filter(0));
                PrintOnlyIfDetail = false;
                RequestFilterFields = "Member No.", "Loan Category";

                column(ROUND__Monthly_Repayment__10_____; ROUND("Loan Repayment Schedule"."Monthly Repayment", 100, '>'))
                {
                }
                column(RepaymentDate_LoanRepaymentSchedule; "Loan Repayment Schedule"."Repayment Date")
                {
                }
                column(FORMAT__Repayment_Date__0_4_; Format("Loan Repayment Schedule"."Repayment Date", 0, '<Day,2> <Month Text,3> <Year4>'))
                {
                }
                column(ROUND__Principal_Repayment__10_____; "Loan Repayment Schedule"."Principal Repayment")
                {
                }
                column(ROUND__Monthly_Interest__10_____; "Loan Repayment Schedule"."Monthly Interest")
                {
                }
                column(LoanBalance; LoanBalance)
                {
                }
                column(Loan_Repayment_Schedule__Repayment_Code_; "Loan Repayment Schedule"."Repayment Code")
                {
                }
                column(ROUND__Monthly_Repayment__10______Control1000000043; "Loan Repayment Schedule"."Monthly Repayment")
                {
                }
                column(ROUND__Principal_Repayment__10______Control1000000014; "Loan Repayment Schedule"."Principal Repayment")
                {
                }
                column(ROUND__Monthly_Interest__10______Control1000000015; "Loan Repayment Schedule"."Monthly Interest")
                {
                }
                column(Monthly_RepaymentCaption; Monthly_RepaymentCaptionLbl)
                {
                }
                column(InterestCaption; InterestCaptionLbl)
                {
                }
                column(Principal_RepaymentCaption; Principal_RepaymentCaptionLbl)
                {
                }
                column(Due_DateCaption; Due_DateCaptionLbl)
                {
                }
                column(Loan_BalanceCaption; Loan_BalanceCaptionLbl)
                {
                }
                column(Loan_RepaymentCaption; Loan_RepaymentCaptionLbl)
                {
                }
                column(TotalCaption; TotalCaptionLbl)
                {
                }
                column(Loan_Repayment_Schedule_Loan_No_; "Loan Repayment Schedule"."Loan No.")
                {
                }
                column(Loan_Repayment_Schedule_Member_No_; "Loan Repayment Schedule"."Member No.")
                {
                }
                column(Loan_Repayment_Schedule_Repayment_Date; "Loan Repayment Schedule"."Repayment Date")
                {
                }
                column(RepaymentCode; "Loan Repayment Schedule"."Instalment No")
                {
                }
                column(MonthlyInsurance_LoanRepaymentSchedule; "Loan Repayment Schedule"."Monthly Insurance")
                {
                }
                column(LoanBalance_LoanRepaymentSchedule; "Loan Repayment Schedule"."Loan Balance")
                {
                }
                trigger OnPreDataItem();
                begin
                    LastFieldNo := FieldNo("Member No.");
                    i := 0;
                    j := 0;
                end;

                trigger OnAfterGetRecord();
                begin
                    /*Cust.RESET;
					//Cust.SETRANGE(Cust."No.","Loans Register Credit"."Client Code");
					Cust.SETRANGE(Cust."No.","Loans Register"."Employer Code");
					IF Cust.FIND('-') THEN BEGIN
					EmployerName:=Cust.Name;
					END;
					i:=i+1;
					TotalPrincipalRepayment:=(TotalPrincipalRepayment+"Principal Repayment");
					IF i=1 THEN
					 LoanBalance:=("Loan Amount")
					ELSE BEGIN
					 LoanBalance:=("Loan Amount"-TotalPrincipalRepayment+"Principal Repayment");
					END;
					*/
                    CumInterest := (CumInterest + "Monthly Interest");
                    CumMonthlyRepayment := (CumMonthlyRepayment + "Monthly Repayment");
                    CumPrincipalRepayment := (CumPrincipalRepayment + "Principal Repayment");

                end;

            }
            trigger OnPreDataItem();
            begin
                CompanyInfo.Get();
                CompanyInfo.CalcFields(CompanyInfo.Picture);
            end;

            trigger OnAfterGetRecord();
            begin
                BankDetails := '';
                if LoanCategory.Get("Loans Register"."Loan Product Type") then
                    BankDetails := LoanCategory."Bank Account Details";
                if "Loans Register"."New Repayment Period" > 0 then begin
                    INST := "Loans Register"."New Repayment Period";
                end else begin
                    INST := "Loans Register".Installments;
                end;
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
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: label 'Total for ';
        Duration: Integer;
        MemberLoan: Record Customer;
        IssuedDate: Date;
        LoanCategory: Record "Loan Products Setup";
        i: Integer;
        LoanBalance: Decimal;
        CumInterest: Decimal;
        CumMonthlyRepayment: Decimal;
        CumPrincipalRepayment: Decimal;
        j: Integer;
        LoanApp: Record "Loans Register";
        GroupName: Text[70];
        TotalPrincipalRepayment: Decimal;
        Rate: Decimal;
        BankDetails: Text[250];
        Cust: Record Customer;
        Intallments__Months_CaptionLbl: label 'Intallments (Months)';
        Disbursment_DateCaptionLbl: label 'Disbursment Date';
        Current_InterestCaptionLbl: label 'Current Interest';
        Loan_AmountCaptionLbl: label 'Loan Amount';
        Loan_ProductCaptionLbl: label 'Loan Product';
        Loan_No_CaptionLbl: label 'Loan No.';
        Account_No_CaptionLbl: label 'Account No.';
        Monthly_RepaymentCaptionLbl: label 'Monthly Repayment';
        InterestCaptionLbl: label 'Interest';
        Principal_RepaymentCaptionLbl: label 'Principal Repayment';
        Due_DateCaptionLbl: label 'Due Date';
        Loan_BalanceCaptionLbl: label 'Loan Balance';
        Loan_RepaymentCaptionLbl: label 'Loan Repayment';
        TotalCaptionLbl: label 'Total';
        EmployerName: Text;
        INST: Integer;
        CompanyInfo: Record "Company Information";


    var

}
