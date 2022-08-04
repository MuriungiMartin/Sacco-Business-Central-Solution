#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
// dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
// {
//     assembly("ForNav.Reports.6.3.0.2259")
//     {
//         type(ForNav.Report_6_3_0_2259; ForNavReport51516868_v6_3_0_2259) { }
//     }
// } // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50868 "Loans Balances Report"
{
    RDLCLayout = 'Layouts/LoansBalancesReport.rdlc';
    DefaultLayout = RDLC;
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Loans Register"; "Loans Register")
        {
            CalcFields = "Outstanding Balance", "Interest Paid", "Principal Paid", "Scheduled Principal to Date", "Schedule Interest to Date";
            DataItemTableView = sorting("Loan  No.") order(ascending) where("Outstanding Balance" = filter(<> 0));
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Loan  No.", Source, "Loan Product Type", "Date filter", "Application Date", "Loan Status", "Issued Date", Posted, "Batch No.", "Captured By", "Branch Code", "Outstanding Balance", "Date Approved", "Employer Code", Closed;
            // column(ReportForNavId_4645; 4645) { } // Autogenerated by ForNav - Do not delete
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
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
            // column(CurrReport_PAGENO; Format(ReportForNav.PageNo))
            // {
            // }
            column(UserId; UserId)
            {
            }
            column(LoanType; LoanType)
            {
            }
            column(LoanProductTypeName_LoansRegister; "Loans Register"."Loan Product Type Name")
            {
            }
            column(RFilters; RFilters)
            {
            }
            column(Loans__Loan__No__; "Loans Register"."Loan  No.")
            {
            }
            column(Loans__Client_Code_; "Loans Register"."Client Code")
            {
            }
            column(Loans__Client_Name_; "Loans Register"."Client Name")
            {
            }
            column(Employer_Code; LAppl."Employer Code")
            {
            }
            column(InterestDue; InterestDue)
            {
            }
            column(LoanArrears; LoanArrears)
            {
            }
            column(Staff_No; LAppl."Staff No")
            {
            }
            column(Loans__Requested_Amount_; "Loans Register"."Requested Amount")
            {
            }
            column(TotalsLoanOutstanding_Loans; "Loans Register"."Total loan Outstanding")
            {
            }
            column(Loans__Approved_Amount_; "Loans Register"."Approved Amount")
            {
            }
            column(Upfronts; "Loans Register".Upfronts)
            {
            }
            column(Cheque_No; LAppl."Cheque No.")
            {
            }
            column(Netdisbursed; Netdisbursed)
            {
            }
            column(CurrentShares_Loans; "Loans Register"."Current Shares")
            {
            }
            column(EmployerName_Loans; "Loans Register"."Employer Name")
            {
            }
            column(TotalUpfronts; TotalUpfronts)
            {
            }
            column(EmployerCode_Loans; "Loans Register"."Employer Code")
            {
            }
            column(TotalNetPay; TotalNetPay)
            {
            }
            column(Loans_Installments; "Loans Register".Installments)
            {
            }
            column(InterestPaid_LoansRegister; "Loans Register"."Interest Paid")
            {
            }
            column(DateApproved_Loans; Format("Loans Register"."Date Approved"))
            {
            }
            column(Loans__Loan_Status_; "Loans Register"."Loan Status")
            {
            }
            column(Loans_Loans__Outstanding_Balance_; "Loans Register"."Outstanding Balance")
            {
            }
            column(Loans__Application_Date_; "Loans Register"."Application Date")
            {
            }
            column(Loans__Issued_Date_; "Loans Register"."Issued Date")
            {
            }
            column(Loans__Oustanding_Interest_; "Loans Register"."Outstanding Interest")
            {
            }
            column(Loans_Loans__Loan_Product_Type_; "Loans Register"."Loan Product Type")
            {
            }
            column(Loans__Last_Pay_Date_; "Loans Register"."Last Pay Date")
            {
            }
            column(Loans__Top_Up_Amount_; "Loans Register"."Loan Offset Amount")
            {
            }
            column(Loans__Approved_Amount__Control1102760017; "Loans Register"."Approved Amount")
            {
            }
            column(Loans__Requested_Amount__Control1102760038; "Loans Register"."Requested Amount")
            {
            }
            column(LCount; LCount)
            {
            }
            column(Loans_Loans__Outstanding_Balance__Control1102760040; "Loans Register"."Outstanding Balance")
            {
            }
            column(Loans__Oustanding_Interest__Control1102760041; "Loans Register"."Outstanding Interest")
            {
            }
            column(TopUp_Commission; LAppl."Total Offset Commission")
            {
            }
            column(Loans__Top_Up_Amount__Control1000000001; "Loans Register"."Loan Offset Amount")
            {
            }
            column(Loans_RegisterCaption; Loans_RegisterCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Loan_TypeCaption; Loan_TypeCaptionLbl)
            {
            }
            column(Loans__Loan__No__Caption; FieldCaption("Loan  No."))
            {
            }
            column(Client_No_Caption; Client_No_CaptionLbl)
            {
            }
            column(Comment; Comment)
            {
            }
            column(Loans__Client_Name_Caption; FieldCaption("Client Name"))
            {
            }
            column(Loans__Requested_Amount_Caption; FieldCaption("Requested Amount"))
            {
            }
            column(Loans__Approved_Amount_Caption; FieldCaption("Approved Amount"))
            {
            }
            column(Loans__Loan_Status_Caption; FieldCaption("Loan Status"))
            {
            }
            column(Outstanding_LoanCaption; Outstanding_LoanCaptionLbl)
            {
            }
            column(PeriodCaption; PeriodCaptionLbl)
            {
            }
            column(Loans__Application_Date_Caption; FieldCaption("Application Date"))
            {
            }
            column(Approved_DateCaption; Approved_DateCaptionLbl)
            {
            }
            column(Loans__Oustanding_Interest_Caption; FieldCaption("Outstanding Interest"))
            {
            }
            column(Loan_TypeCaption_Control1102760043; Loan_TypeCaption_Control1102760043Lbl)
            {
            }
            column(Loans__Last_Pay_Date_Caption; FieldCaption("Last Pay Date"))
            {
            }
            column(Loans__Top_Up_Amount_Caption; FieldCaption("Loan Offset Amount"))
            {
            }
            column(Verified_By__________________________________________________Caption; Verified_By__________________________________________________CaptionLbl)
            {
            }
            column(Confirmed_By__________________________________________________Caption; Confirmed_By__________________________________________________CaptionLbl)
            {
            }
            column(Sign________________________Caption; Sign________________________CaptionLbl)
            {
            }
            column(Sign________________________Caption_Control1102755003; Sign________________________Caption_Control1102755003Lbl)
            {
            }
            column(Date________________________Caption; Date________________________CaptionLbl)
            {
            }
            column(Date________________________Caption_Control1102755005; Date________________________Caption_Control1102755005Lbl)
            {
            }
            column(NameCreditOff; NameCreditOff)
            {
            }
            column(NameCreditDate; NameCreditDate)
            {
            }
            column(NameCreditSign; NameCreditSign)
            {
            }
            column(NameCreditMNG; NameCreditMNG)
            {
            }
            column(NameCreditMNGDate; NameCreditMNGDate)
            {
            }
            column(NameCreditMNGSign; NameCreditMNGSign)
            {
            }
            column(NameCEO; NameCEO)
            {
            }
            column(NameCEOSign; NameCEOSign)
            {
            }
            column(NameCEODate; NameCEODate)
            {
            }
            column(CreditCom1; CreditCom1)
            {
            }
            column(CreditCom1Date; CreditCom1Date)
            {
            }
            column(CreditCom2; CreditCom2)
            {
            }
            column(CreditCom2Sign; CreditCom2Sign)
            {
            }
            column(CreditCom2Date; CreditCom2Date)
            {
            }
            column(CreditCom3; CreditCom3)
            {
            }
            column(CreditComDate3; CreditComDate3)
            {
            }
            column(CreditComSign3; CreditComSign3)
            {
            }
            column(COMPPIC; PICTURE)
            {
            }
            column(Name; Name)
            {
            }
            trigger OnPreDataItem();
            begin
                // CREATETOTALS("Net Repayment");
                DateFilter := GetFilter("Loans Register"."Date filter");
                if LoanProdType.Get("Loans Register".GetFilter("Loans Register"."Loan Product Type")) then
                    LoanType := LoanProdType."Product Description";
                LCount := 0;
                if "Loans Register".GetFilter("Loans Register"."Branch Code") <> '' then begin
                    DValue.Reset;
                    DValue.SetRange(DValue."Global Dimension No.", 2);
                    DValue.SetRange(DValue.Code, "Loans Register".GetFilter("Loans Register"."Branch Code"));
                    if DValue.Find('-') then
                        RFilters := 'Branch: ' + DValue.Name;
                end;
            end;

            trigger OnAfterGetRecord();
            begin
                CompanyCode := '';
                if cust.Get("Loans Register"."BOSA No") then
                    CompanyCode := cust."Employer Code";
                LCount := LCount + 1;
                InterestDue := "Loans Register"."Schedule Interest to Date";//SFactory.FnGetInterestDueFiltered("Loans Register",DateFilter);
                LoanArrears := "Loans Register"."Scheduled Principal to Date" - Abs("Loans Register"."Principal Paid");
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
                //     field(ForNavOpenDesigner; ReportForNavOpenDesigner)
                //     {
                //         ApplicationArea = Basic;
                //         Caption = 'Design';
                //         Visible = ReportForNavAllowDesign;
                //         trigger OnValidate()
                //         begin
                //             ReportForNav.LaunchDesigner(ReportForNavOpenDesigner);
                //             CurrReport.RequestOptionsPage.Close();
                //         end;

                //     }
            }
        }

        actions
        {
        }
        trigger OnOpenPage()
        begin
            // ReportForNavOpenDesigner := false;
        end;
    }

    trigger OnInitReport()
    begin
        Company.Get();
        Company.CalcFields(Company.Picture);
        ;
        // ReportsForNavInit;

    end;

    trigger OnPostReport()
    begin
        ;
        //ReportForNav.Post;
    end;

    trigger OnPreReport()
    begin
        if "COMPY INFOR".Get then begin
            "COMPY INFOR".CalcFields("COMPY INFOR".Picture);
            Name := "COMPY INFOR".Name;
        end;
        ;
        // ReportsForNavPre;
    end;

    var
        RPeriod: Decimal;
        BatchL: Code[100];
        Batches: Record "Loan Disburesment-Batching";
        ApprovalSetup: Record "Table Permission Buffer";
        LocationFilter: Code[20];
        TotalApproved: Decimal;
        cust: Record "Members Register";
        BOSABal: Decimal;
        SuperBal: Decimal;
        LAppl: Record "Loans Register";
        Deposits: Decimal;
        CompanyCode: Code[20];
        LoanType: Text[50];
        LoanProdType: Record "Loan Products Setup";
        LCount: Integer;
        RFilters: Text[250];
        DValue: Record "Dimension Value";
        VALREPAY: Record "Member Ledger Entry";
        Loans_RegisterCaptionLbl: label 'Approved Loans Report';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Loan_TypeCaptionLbl: label 'Loan Type';
        Client_No_CaptionLbl: label 'Client No.';
        Outstanding_LoanCaptionLbl: label 'Outstanding Loan';
        PeriodCaptionLbl: label 'Period';
        Approved_DateCaptionLbl: label 'Approved Date';
        Loan_TypeCaption_Control1102760043Lbl: label 'Loan Type';
        Verified_By__________________________________________________CaptionLbl: label 'Verified By..................';
        Confirmed_By__________________________________________________CaptionLbl: label 'Confirmed By..................';
        Sign________________________CaptionLbl: label 'Sign...............';
        Sign________________________Caption_Control1102755003Lbl: label 'Sign...............';
        Date________________________CaptionLbl: label 'Date..............';
        Date________________________Caption_Control1102755005Lbl: label 'Date..............';
        GenSetUp: Record "Sacco General Set-Up";
        LoanApp: Record "Loans Register";
        CustRec: Record "Members Register";
        CustRecord: Record "Members Register";
        TShares: Decimal;
        TLoans: Decimal;
        LoanShareRatio: Decimal;
        Eligibility: Decimal;
        TotalSec: Decimal;
        saccded: Decimal;
        saccded2: Decimal;
        grosspay: Decimal;
        Tdeduct: Decimal;
        Cshares: Decimal;
        "Cshares*3": Decimal;
        "Cshares*4": Decimal;
        QUALIFY_SHARES: Decimal;
        salary: Decimal;
        LoanG: Record "Loans Guarantee Details";
        GShares: Decimal;
        Recomm: Decimal;
        GShares1: Decimal;
        NETTAKEHOME: Decimal;
        Msalary: Decimal;
        RecPeriod: Integer;
        FOSARecomm: Decimal;
        FOSARecoPRD: Integer;
        "Asset Value": Decimal;
        InterestRate: Decimal;
        RepayPeriod: Decimal;
        LBalance: Decimal;
        TotalMRepay: Decimal;
        LInterest: Decimal;
        LPrincipal: Decimal;
        SecuredSal: Decimal;
        Linterest1: Integer;
        LOANBALANCE: Decimal;
        BRIDGEDLOANS: Record "Loan Offset Details";
        BRIDGEBAL: Decimal;
        LOANBALANCEFOSASEC: Decimal;
        TotalTopUp: Decimal;
        TotalIntPayable: Decimal;
        GTotals: Decimal;
        TempVal: Decimal;
        TempVal2: Decimal;
        "TempCshares*4": Decimal;
        "TempCshares*3": Decimal;
        InstallP: Decimal;
        RecomRemark: Text[150];
        InstallRecom: Decimal;
        TopUpComm: Decimal;
        TotalTopupComm: Decimal;
        LoanTopUp: Record "Loan Offset Details";
        "Interest Payable": Decimal;
        "general set-up": Record "Sacco General Set-Up";
        Days: Integer;
        EndMonthInt: Decimal;
        BRIDGEBAL2: Decimal;
        DefaultInfo: Text[80];
        TOTALBRIDGED: Decimal;
        DEpMultiplier: Decimal;
        MAXAvailable: Decimal;
        SalDetails: Record "Loan Appraisal Salary Details";
        Earnings: Decimal;
        Deductions: Decimal;
        BrTopUpCom: Decimal;
        LoanAmount: Decimal;
        Company: Record "Company Information";
        CompanyAddress: Code[20];
        CompanyEmail: Text[30];
        CompanyTel: Code[20];
        CurrentAsset: Decimal;
        CurrentLiability: Decimal;
        FixedAsset: Decimal;
        Equity: Decimal;
        Sales: Decimal;
        SalesOnCredit: Decimal;
        AppraiseDeposits: Boolean;
        AppraiseShares: Boolean;
        AppraiseSalary: Boolean;
        AppraiseGuarantors: Boolean;
        AppraiseBusiness: Boolean;
        TLoan: Decimal;
        LoanBal: Decimal;
        GuaranteedAmount: Decimal;
        RunBal: Decimal;
        TGuaranteedAmount: Decimal;
        GuarantorQualification: Boolean;
        TotalLoanBalance: Decimal;
        TGAmount: Decimal;
        NetSalary: Decimal;
        Riskamount: Decimal;
        WarnBridged: Text;
        WarnSalary: Text;
        WarnDeposits: Text;
        WarnGuarantor: Text;
        WarnShare: Text;
        RiskGshares: Decimal;
        RiskDeposits: Decimal;
        BasicEarnings: Decimal;
        DepX: Decimal;
        LoanPrincipal: Decimal;
        loanInterest: Decimal;
        AmountGuaranteed: Decimal;
        StatDeductions: Decimal;
        GuarOutstanding: Decimal;
        TwoThirds: Decimal;
        Bridged_AmountCaption: Integer;
        LNumber: Code[20];
        TotalLoanDeductions: Decimal;
        TotalRepayments: Decimal;
        Totalinterest: Decimal;
        Band: Decimal;
        TotalOutstanding: Decimal;
        BANDING: Record "Deposit Tier Setup";
        NtTakeHome: Decimal;
        ATHIRD: Decimal;
        Psalary: Decimal;
        LoanApss: Record "Loans Register";
        TotalLoanBal: Decimal;
        TotalBand: Decimal;
        LoanAp: Record "Loans Register";
        TotalRepay: Decimal;
        TotalInt: Decimal;
        LastFieldNo: Integer;
        TotLoans: Decimal;
        JazaLevy: Decimal;
        BridgeLevy: Decimal;
        Upfronts: Decimal;
        Netdisbursed: Decimal;
        TotalLRepayments: Decimal;
        BridgedRepayment: Decimal;
        OutstandingLrepay: Decimal;
        Loantop: Record "Loan Offset Details";
        BRIGEDAMOUNT: Decimal;
        TOTALBRIGEDAMOUNT: Decimal;
        FinalInst: Decimal;
        NonRec: Decimal;
        TotalUpfronts: Decimal;
        TotalNetPay: Decimal;
        NameCreditOff: label 'Name.......................';
        NameCreditDate: label 'Date........................';
        NameCreditSign: label 'Signature..................';
        NameCreditMNG: label 'Name.......................';
        NameCreditMNGDate: label 'Date........................';
        NameCreditMNGSign: label 'Signature..................';
        NameCEO: label 'Name......................';
        NameCEOSign: label 'Signature.................';
        NameCEODate: label 'Date.......................';
        CreditCom1: label 'Name......................';
        CreditCom1Sign: label 'Signature.................';
        CreditCom1Date: label 'Date.......................';
        CreditCom2: label 'Name......................';
        CreditCom2Sign: label 'Signature.................';
        CreditCom2Date: label 'Date......................';
        CreditCom3: label 'Name.....................';
        CreditComDate3: label 'Date......................';
        CreditComSign3: label 'Signature.................';
        Comment: label '....................';
        "COMPY INFOR": Record "Company Information";
        Name: Text;
        PICTURE: Text;
        InterestDue: Decimal;
        SFactory: Codeunit "SURESTEP Factory";
        DateFilter: Text;
        PrincipalDue: Decimal;
        LoanArrears: Decimal;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
    //     [WithEvents]
    //     ReportForNav: DotNet ForNavReport51516868_v6_3_0_2259;
    //     ReportForNavOpenDesigner: Boolean;
    //     [InDataSet]
    //     ReportForNavAllowDesign: Boolean;

    // local procedure ReportsForNavInit();
    // var
    //     ApplicationSystemConstants: Codeunit "Application System Constants";
    //     addInFileName: Text;
    //     tempAddInFileName: Text;
    //     path: DotNet Path;
    //     ReportForNavObject: Variant;
    // begin
    //     addInFileName := ApplicationPath() + 'Add-ins\ReportsForNAV_6_3_0_2259\ForNav.Reports.6.3.0.2259.dll';
    //     if not File.Exists(addInFileName) then begin
    //         tempAddInFileName := path.GetTempPath() + '\Microsoft Dynamics NAV\Add-Ins\' + ApplicationSystemConstants.PlatformFileVersion() + '\ForNav.Reports.6.3.0.2259.dll';
    //         if not File.Exists(tempAddInFileName) then
    //             Error('Please install the ForNAV DLL version 6.3.0.2259 in your service tier Add-ins folder under the file name "%1"\\If you already have the ForNAV DLL on the server, you should move it to this folder and rename it to match this file name.', addInFileName);
    //     end;
    //     ReportForNavObject := ReportForNav.GetLatest(CurrReport.OBJECTID, CurrReport.Language, SerialNumber, UserId, CompanyName);
    //     ReportForNav := ReportForNavObject;
    //     ReportForNav.Init();
    // end;

    // local procedure ReportsForNavPre();
    // begin
    //     ReportForNav.OpenDesigner := ReportForNavOpenDesigner;
    //     if not ReportForNav.Pre() then CurrReport.Quit();
    // end;

    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
