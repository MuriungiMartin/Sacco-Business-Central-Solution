#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516885_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50885 "Member Account Statement(Ver2)"
{
    RDLCLayout = 'Layouts/MemberAccountStatement(Ver2).rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Members Register"; "Members Register")
        {
            RequestFilterFields = "No.", "Loan Product Filter", "Outstanding Balance", "Date Filter";
            column(ReportForNavId_1102755000; 1102755000) { } // Autogenerated by ForNav - Do not delete
            column(UserId; UserId)
            {
            }
            column(PayrollStaffNo_Members; "Members Register"."Payroll No")
            {
            }
            column(No_Members; "Members Register"."No.")
            {
            }
            column(Name_Members; "Members Register".Name)
            {
            }
            column(EmployerCode_Members; "Members Register"."Employer Code")
            {
            }
            column(EmployerName; EmployerName)
            {
            }
            column(PageNo_Members; Format(ReportForNav.PageNo))
            {
            }
            column(Shares_Retained; "Members Register"."Shares Retained")
            {
            }
            column(IDNo_Members; "Members Register"."ID No.")
            {
            }
            column(GlobalDimension2Code_Members; "Members Register"."Global Dimension 2 Code")
            {
            }
            column(Company_Name; Company.Name)
            {
            }
            column(Company_Address; Company.Address)
            {
            }
            column(Company_Address_2; Company."Address 2")
            {
            }
            column(Company_Phone_No; Company."Phone No.")
            {
            }
            column(Company_Fax_No; Company."Fax No.")
            {
            }
            column(Company_Picture; Company.Picture)
            {
            }
            column(Company_Email; Company."E-Mail")
            {
            }
            dataitem(ShareCapital; "Member Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No."), "Posting Date" = field("Date Filter");
                DataItemTableView = sorting("Posting Date") where("Transaction Type" = filter("Benevolent Fund" | "Share Capital"), Reversed = filter(false));
                column(ReportForNavId_1000000009; 1000000009) { } // Autogenerated by ForNav - Do not delete
                column(PostingDate_ShareCapital; ShareCapital."Posting Date")
                {
                }
                column(DocumentNo_ShareCapital; ShareCapital."Document No.")
                {
                }
                column(Description_ShareCapital; ShareCapital.Description)
                {
                }
                column(DebitAmount_ShareCapital; ShareCapital."Debit Amount")
                {
                }
                column(CreditAmount_ShareCapital; ShareCapital."Credit Amount")
                {
                }
                column(Amount_ShareCapital; ShareCapital.Amount)
                {
                }
                column(TransactionType_ShareCapital; ShareCapital."Transaction Type")
                {
                }
                column(UserID_ShareCapital; ShareCapital."User ID")
                {
                }
                column(OpenBalanceShareCap; OpenBalanceShareCap)
                {
                }
                column(ClosingBalanceShareCap; ClosingBalanceShareCap)
                {
                }
                column(ShareCapBF; ShareCapBF)
                {
                }
                trigger OnPreDataItem();
                begin
                    ClosingBalanceShareCap := ShareCapBF;
                    OpenBalanceShareCap := ShareCapBF;
                end;

                trigger OnAfterGetRecord();
                begin
                    ClosingBalanceShareCap := ClosingBalanceShareCap + (ShareCapital.Amount * -1);
                end;

            }
            dataitem(Deposits; "Member Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No."), "Posting Date" = field("Date Filter");
                DataItemTableView = sorting("Posting Date") where("Transaction Type" = filter("Deposit Contribution"), Reversed = const(false));
                column(ReportForNavId_1000000036; 1000000036) { } // Autogenerated by ForNav - Do not delete
                column(PostingDate_Deposits; Deposits."Posting Date")
                {
                }
                column(DocumentNo_Deposits; Deposits."Document No.")
                {
                }
                column(Description_Deposits; Deposits.Description)
                {
                }
                column(Amount_Deposits; Deposits.Amount)
                {
                }
                column(DebitAmount_Deposits; Deposits."Debit Amount")
                {
                }
                column(CreditAmount_Deposits; Deposits."Credit Amount")
                {
                }
                column(TransactionType_Deposits; Deposits."Transaction Type")
                {
                }
                column(UserID_Deposits; Deposits."User ID")
                {
                }
                column(OpenBalanceDeposits; OpenBalanceDeposits)
                {
                }
                column(ClosingBalanceDeposits; ClosingBalanceDeposits)
                {
                }
                column(SharesBF; SharesBF)
                {
                }
                trigger OnPreDataItem();
                begin
                    ClosingBalanceDeposits := SharesBF;
                    OpenBalanceDeposits := SharesBF;
                end;

                trigger OnAfterGetRecord();
                begin
                    ClosingBalanceDeposits := ClosingBalanceDeposits + (Deposits.Amount * -1);
                end;

            }
            dataitem(Dividend; "Member Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No."), "Posting Date" = field("Date Filter");
                DataItemTableView = sorting("Posting Date") where("Transaction Type" = filter("Junior Savings"), Reversed = filter(false));
                column(ReportForNavId_1000000059; 1000000059) { } // Autogenerated by ForNav - Do not delete
                column(PostingDate_Dividend; Dividend."Posting Date")
                {
                }
                column(DocumentNo_Dividend; Dividend."Document No.")
                {
                }
                column(Description_Dividend; Dividend.Description)
                {
                }
                column(Amount_Dividend; Dividend.Amount)
                {
                }
                column(UserID_Dividend; Dividend."User ID")
                {
                }
                column(TransactionType_Dividend; Dividend."Transaction Type")
                {
                }
                column(DebitAmount_Dividend; Dividend."Debit Amount")
                {
                }
                column(CreditAmount_Dividend; Dividend."Credit Amount")
                {
                }
                column(OpenBalanceDividend; OpenBalanceDividend)
                {
                }
                column(ClosingBalanceDividend; ClosingBalanceDividend)
                {
                }
                column(DividendBF; DividendBF)
                {
                }
                trigger OnPreDataItem();
                begin
                    ClosingBalanceDividend := DividendBF;
                    OpenBalanceDividend := DividendBF;
                end;

                trigger OnAfterGetRecord();
                begin
                    ClosingBalanceDividend := ClosingBalanceDividend + (Dividend.Amount * -1);
                end;

            }
            dataitem(Junior; "Member Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No."), "Posting Date" = field("Date Filter");
                DataItemTableView = sorting("Posting Date") where("Transaction Type" = filter("Junior Savings"), Reversed = filter(false));
                column(ReportForNavId_1000000071; 1000000071) { } // Autogenerated by ForNav - Do not delete
                column(PostingDate_Junior; Junior."Posting Date")
                {
                }
                column(DocumentNo_Junior; Junior."Document No.")
                {
                }
                column(Description_Junior; Junior.Description)
                {
                }
                column(Amount_Junior; Junior.Amount)
                {
                }
                column(UserID_Junior; Junior."User ID")
                {
                }
                column(DebitAmount_Junior; Junior."Debit Amount")
                {
                }
                column(CreditAmount_Junior; Junior."Credit Amount")
                {
                }
                column(TransactionType_Junior; Junior."Transaction Type")
                {
                }
                column(OpenBalanceJunior; OpenBalanceJunior)
                {
                }
                column(ClosingBalanceJunior; ClosingBalanceJunior)
                {
                }
                column(JuniorBF; JuniorBF)
                {
                }
                trigger OnPreDataItem();
                begin
                    ClosingBalanceJunior := JuniorBF;
                    OpenBalanceJunior := JuniorBF;
                end;

                trigger OnAfterGetRecord();
                begin
                    ClosingBalanceJunior := ClosingBalanceJunior + (Junior.Amount * -1);
                end;

            }
            dataitem(Safari; "Member Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No."), "Posting Date" = field("Date Filter");
                DataItemTableView = sorting("Posting Date") where("Transaction Type" = filter("Safari Savings"), Reversed = filter(false));
                column(ReportForNavId_41; 41) { } // Autogenerated by ForNav - Do not delete
                column(PostingDate_Safari; Safari."Posting Date")
                {
                }
                column(DocumentNo_Safari; Safari."Document No.")
                {
                }
                column(Description_Safari; Safari.Description)
                {
                }
                column(Amount_Safari; Safari.Amount)
                {
                }
                column(UserID_Safari; Safari."User ID")
                {
                }
                column(DebitAmount_Safari; Safari."Debit Amount")
                {
                }
                column(CreditAmount_Safari; Safari."Credit Amount")
                {
                }
                column(TransactionType_Safari; Safari."Transaction Type")
                {
                }
                column(OpenBalanceSafari; OpenBalanceSafari)
                {
                }
                column(ClosingBalanceSafari; ClosingBalanceSafari)
                {
                }
                column(SafariBF; SafariBF)
                {
                }
                trigger OnPreDataItem();
                begin
                    ClosingBalanceSafari := SafariBF;
                    OpenBalanceSafari := SafariBF;
                end;

                trigger OnAfterGetRecord();
                begin
                    ClosingBalanceSafari := ClosingBalanceSafari + (Safari.Amount * -1);
                end;

            }
            dataitem(Silver; "Member Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No."), "Posting Date" = field("Date Filter");
                DataItemTableView = sorting("Posting Date") where("Transaction Type" = filter("Silver Savings"), Reversed = filter(false));
                column(ReportForNavId_53; 53) { } // Autogenerated by ForNav - Do not delete
                column(PostingDate_Silver; Silver."Posting Date")
                {
                }
                column(DocumentNo_Silver; Silver."Document No.")
                {
                }
                column(Description_Silver; Silver.Description)
                {
                }
                column(Amount_Silver; Silver.Amount)
                {
                }
                column(UserID_Silver; Silver."User ID")
                {
                }
                column(DebitAmount_Silver; Silver."Debit Amount")
                {
                }
                column(CreditAmount_Silver; Silver."Credit Amount")
                {
                }
                column(TransactionType_Silver; Silver."Transaction Type")
                {
                }
                column(OpenBalanceSilver; OpenBalanceSilver)
                {
                }
                column(ClosingBalanceSilver; ClosingBalanceSilver)
                {
                }
                column(SilverBF; SilverBF)
                {
                }
                trigger OnPreDataItem();
                begin
                    ClosingBalanceSilver := SilverBF;
                    OpenBalanceSilver := SilverBF;
                end;

                trigger OnAfterGetRecord();
                begin
                    ClosingBalanceSilver := ClosingBalanceSilver + (Silver.Amount * -1);
                end;

            }
            dataitem(AdditionalShares; "Member Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No."), "Posting Date" = field("Date Filter");
                DataItemTableView = sorting("Posting Date") where("Transaction Type" = filter("Additional Shares"));
                column(ReportForNavId_27; 27) { } // Autogenerated by ForNav - Do not delete
                column(PostingDate_AdditionalShares; AdditionalShares."Posting Date")
                {
                }
                column(DocumentNo_AdditionalShares; AdditionalShares."Document No.")
                {
                }
                column(Description_AdditionalShares; AdditionalShares.Description)
                {
                }
                column(Amount_AdditionalShares; AdditionalShares.Amount)
                {
                }
                column(UserID_AdditionalShares; AdditionalShares."User ID")
                {
                }
                column(DebitAmount_AdditionalShares; AdditionalShares."Debit Amount")
                {
                }
                column(CreditAmount_AdditionalShares; AdditionalShares."Credit Amount")
                {
                }
                column(TransactionType_AdditionalShares; AdditionalShares."Transaction Type")
                {
                }
                column(OpenBalanceAdditionalShares; OpenBalanceAdditionalShares)
                {
                }
                column(ClosingBalanceAdditionalShares; ClosingBalanceAdditionalShares)
                {
                }
                column(AdditionalSharesBF; AdditionalSharesBF)
                {
                }
                trigger OnPreDataItem();
                begin
                    ClosingBalanceAdditionalShares := AdditionalSharesBF;
                    OpenBalanceAdditionalShares := AdditionalSharesBF;
                end;

                trigger OnAfterGetRecord();
                begin
                    //ClosingBalanceFOSAShares:=ClosingBalanceFOSAShares+(FOSAShares.Amount*-1);
                end;

            }
            dataitem(Loans; "Loans Register")
            {
                DataItemLink = "Client Code" = field("No."), "Date filter" = field("Date Filter"), "Loan Product Type" = field("Loan Product Filter");
                DataItemTableView = sorting("Loan  No.") where(Posted = const(true));
                column(ReportForNavId_1102755024; 1102755024) { } // Autogenerated by ForNav - Do not delete
                column(PrincipleBF; PrincipleBF)
                {
                }
                column(LoanNumber; Loans."Loan  No.")
                {
                }
                column(ProductType; LoanName)
                {
                }
                column(RequestedAmount; Loans."Requested Amount")
                {
                }
                column(Interest; Loans.Interest)
                {
                }
                column(Installments; Loans.Installments)
                {
                }
                column(LoanPrincipleRepayment; Loans."Loan Principle Repayment")
                {
                }
                column(ApprovedAmount_Loans; Loans."Approved Amount")
                {
                }
                column(LoanProductTypeName_Loans; Loans."Loan Product Type Name")
                {
                }
                column(Repayment_Loans; Loans.Repayment)
                {
                }
                column(ModeofDisbursement_Loans; Loans."Mode of Disbursement")
                {
                }
                column(OutstandingBalance_Loans; Loans."Outstanding Balance")
                {
                }
                column(OustandingInterest_Loans; Loans."Outstanding Interest")
                {
                }
                dataitem(loan; "Member Ledger Entry")
                {
                    DataItemLink = "Customer No." = field("Client Code"), "Loan No" = field("Loan  No."), "Posting Date" = field("Date filter");
                    DataItemTableView = sorting("Posting Date") where("Transaction Type" = filter(Loan | "Loan Repayment" | "Interest Paid" | "Interest Paid"), Reversed = const(false));
                    column(ReportForNavId_1102755031; 1102755031) { } // Autogenerated by ForNav - Do not delete
                    column(PostingDate_loan; loan."Posting Date")
                    {
                    }
                    column(DocumentNo_loan; loan."Document No.")
                    {
                    }
                    column(Description_loan; loan.Description)
                    {
                    }
                    column(DebitAmount_Loan; loan."Debit Amount")
                    {
                    }
                    column(CreditAmount_Loan; loan."Credit Amount")
                    {
                    }
                    column(Amount_Loan; loan.Amount)
                    {
                    }
                    column(openBalance_loan; OpenBalance)
                    {
                    }
                    column(CLosingBalance_loan; CLosingBalance)
                    {
                    }
                    column(TransactionType_loan; loan."Transaction Type")
                    {
                    }
                    column(InterestBF; InterestBF)
                    {
                    }
                    column(ClosingBalInt; ClosingBalInt)
                    {
                    }
                    column(LoanNo; loan."Loan No")
                    {
                    }
                    column(PrincipleBF_loans; PrincipleBF)
                    {
                    }
                    column(Loan_Description; loan.Description)
                    {
                    }
                    column(User7; loan."User ID")
                    {
                    }
                    trigger OnPreDataItem();
                    begin
                        CLosingBalance := PrincipleBF;
                        OpeningBal := PrincipleBF;
                        OpeningBalInt := InterestBF;
                    end;

                    trigger OnAfterGetRecord();
                    begin
                        if ((loan."Transaction Type" = loan."transaction type"::Loan) or (loan."Transaction Type" = loan."transaction type"::"Loan Repayment")) then
                            CLosingBalance := CLosingBalance + loan.Amount;
                        if ((loan."Transaction Type" = loan."transaction type"::"Interest Due") or (loan."Transaction Type" = loan."transaction type"::"Interest Paid")) then
                            ClosingBalInt := ClosingBalInt + loan.Amount;
                        if Loans."Loan  No." = '' then begin
                        end;
                    end;

                }
                trigger OnPreDataItem();
                begin
                    Loans.SetFilter(Loans."Date filter", "Members Register".GetFilter("Members Register"."Date Filter"));
                end;

                trigger OnAfterGetRecord();
                begin
                    if LoanSetup.Get(Loans."Loan Product Type") then
                        LoanName := LoanSetup."Product Description";
                    if DateFilterBF <> '' then begin
                        LoansR.Reset;
                        LoansR.SetRange(LoansR."Loan  No.", "Loan  No.");
                        LoansR.SetFilter(LoansR."Date filter", DateFilterBF);
                        if LoansR.Find('-') then begin
                            LoansR.CalcFields(LoansR."Outstanding Balance", LoansR."Outstanding Interest");
                            PrincipleBF := LoansR."Outstanding Balance";
                            InterestBF := LoansR."Outstanding Interest";
                        end;
                    end;
                end;

            }
            dataitem("Loans Guarantee Details"; "Loans Guarantee Details")
            {
                DataItemLink = "Member No" = field("No.");
                column(ReportForNavId_1000000042; 1000000042) { } // Autogenerated by ForNav - Do not delete
                column(LoanNumb; "Loans Guarantee Details"."Loan No")
                {
                }
                column(MembersNo; "Loans Guarantee Details"."Member No")
                {
                }
                column(Name; "Loans Guarantee Details".Name)
                {
                }
                column(LBalance; "Loans Guarantee Details"."Loan Balance")
                {
                }
                column(Shares; "Loans Guarantee Details".Shares)
                {
                }
                column(LoansGuaranteed; "Loans Guarantee Details"."No Of Loans Guaranteed")
                {
                }
                column(Substituted; "Loans Guarantee Details".Substituted)
                {
                }
            }
            trigger OnPreDataItem();
            begin
                if "Members Register".GetFilter("Members Register"."Date Filter") <> '' then
                    DateFilterBF := '..' + Format(CalcDate('-1D', "Members Register".GetRangeMin("Members Register"."Date Filter")));
            end;

            trigger OnAfterGetRecord();
            begin
                SaccoEmp.Reset;
                SaccoEmp.SetRange(SaccoEmp.Code, "Members Register"."Employer Code");
                if SaccoEmp.Find('-') then
                    EmployerName := SaccoEmp.Description;
                SharesBF := 0;
                InsuranceBF := 0;
                ShareCapBF := 0;
                RiskBF := 0;
                HseBF := 0;
                Dep1BF := 0;
                Dep2BF := 0;
                if DateFilterBF <> '' then begin
                    Cust.Reset;
                    Cust.SetRange(Cust."No.", "No.");
                    Cust.SetFilter(Cust."Date Filter", DateFilterBF);
                    if Cust.Find('-') then begin
                        Cust.CalcFields(Cust."Shares Retained", Cust."Current Shares", Cust."Insurance Fund", Cust."Dividend Amount", Cust."Benevolent Fund", Cust."FOSA Shares", Cust."Additional Shares");
                        SharesBF := (Cust."Current Shares" * -1);
                        ShareCapBF := (Cust."Shares Retained" * -1);
                        RiskBF := Cust."Insurance Fund";
                        DividendBF := Cust."Dividend Amount";
                        BenfundBF := Cust."Benevolent Fund";
                        FOSASharesBF := Cust."FOSA Shares";
                        //Dep1BF:=Cust."Dependant 1";
                        //Dep2BF:=Cust."Dependant 2";
                    end;
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
                    field(ForNavOpenDesigner; ReportForNavOpenDesigner)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Design';
                        Visible = ReportForNavAllowDesign;
                        trigger OnValidate()
                        begin
                            ReportForNav.LaunchDesigner(ReportForNavOpenDesigner);
                            CurrReport.RequestOptionsPage.Close();
                        end;

                    }
                }
            }
        }

        actions
        {
        }
        trigger OnOpenPage()
        begin
            ReportForNavOpenDesigner := false;
        end;
    }

    trigger OnInitReport()
    begin
        ;
        ReportsForNavInit;

    end;

    trigger OnPostReport()
    begin
        ;
        ReportForNav.Post;
    end;

    trigger OnPreReport()
    begin
        Company.Get();
        Company.CalcFields(Company.Picture);
        ;
        ReportsForNavPre;
    end;

    var
        OpenBalance: Decimal;
        CLosingBalance: Decimal;
        OpenBalanceXmas: Decimal;
        CLosingBalanceXmas: Decimal;
        Cust: Record "Members Register";
        OpeningBal: Decimal;
        ClosingBal: Decimal;
        FirstRec: Boolean;
        PrevBal: Integer;
        BalBF: Decimal;
        LoansR: Record "Loans Register";
        DateFilterBF: Text[150];
        SharesBF: Decimal;
        InsuranceBF: Decimal;
        LoanBF: Decimal;
        PrincipleBF: Decimal;
        InterestBF: Decimal;
        ShowZeroBal: Boolean;
        ClosingBalSHCAP: Decimal;
        ShareCapBF: Decimal;
        RiskBF: Decimal;
        DividendBF: Decimal;
        BenfundBF: Decimal;
        FOSASharesBF: Decimal;
        AdditionalSharesBF: Decimal;
        Company: Record "Company Information";
        OpenBalanceHse: Decimal;
        CLosingBalanceHse: Decimal;
        OpenBalanceDep1: Decimal;
        CLosingBalanceDep1: Decimal;
        OpenBalanceDep2: Decimal;
        CLosingBalanceDep2: Decimal;
        HseBF: Decimal;
        Dep1BF: Decimal;
        Dep2BF: Decimal;
        OpeningBalInt: Decimal;
        ClosingBalInt: Decimal;
        InterestPaid: Decimal;
        SumInterestPaid: Decimal;
        OpenBalanceRisk: Decimal;
        CLosingBalanceRisk: Decimal;
        OpenBalanceHoliday: Decimal;
        ClosingBalanceHoliday: Decimal;
        LoanSetup: Record "Loan Products Setup";
        LoanName: Text[50];
        SaccoEmp: Record "Sacco Employers";
        EmployerName: Text[100];
        OpenBalanceShareCap: Decimal;
        ClosingBalanceShareCap: Decimal;
        OpenBalanceDeposits: Decimal;
        ClosingBalanceDeposits: Decimal;
        OpenBalanceDividend: Decimal;
        ClosingBalanceDividend: Decimal;
        OpenBalanceJunior: Decimal;
        ClosingBalanceJunior: Decimal;
        OpenBalanceFOSAShares: Decimal;
        ClosingBalanceFOSAShares: Decimal;
        OpenBalanceAdditionalShares: Decimal;
        ClosingBalanceAdditionalShares: Decimal;
        JuniorBF: Decimal;
        OpenBalanceSafari: Decimal;
        ClosingBalanceSafari: Decimal;
        SafariBF: Decimal;
        OpenBalanceSilver: Decimal;
        ClosingBalanceSilver: Decimal;
        SilverBF: Decimal;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516885_v6_3_0_2259;
        ReportForNavOpenDesigner: Boolean;
        [InDataSet]
        ReportForNavAllowDesign: Boolean;

    local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet Path;
        ReportForNavObject: Variant;
    begin
        addInFileName := ApplicationPath() + 'Add-ins\ReportsForNAV_6_3_0_2259\ForNav.Reports.6.3.0.2259.dll';
        if not File.Exists(addInFileName) then begin
            tempAddInFileName := path.GetTempPath() + '\Microsoft Dynamics NAV\Add-Ins\' + ApplicationSystemConstants.PlatformFileVersion() + '\ForNav.Reports.6.3.0.2259.dll';
            if not File.Exists(tempAddInFileName) then
                Error('Please install the ForNAV DLL version 6.3.0.2259 in your service tier Add-ins folder under the file name "%1"\\If you already have the ForNAV DLL on the server, you should move it to this folder and rename it to match this file name.', addInFileName);
        end;
        ReportForNavObject := ReportForNav.GetLatest(CurrReport.OBJECTID, CurrReport.Language, SerialNumber, UserId, CompanyName);
        ReportForNav := ReportForNavObject;
        ReportForNav.Init();
    end;

    local procedure ReportsForNavPre();
    begin
        ReportForNav.OpenDesigner := ReportForNavOpenDesigner;
        if not ReportForNav.Pre() then CurrReport.Quit();
    end;

    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
