#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516909_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50909 "Loan Movement Report"
{
    RDLCLayout = './Layouts/LoanMovementReport.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Loan Products Setup"; "Loan Products Setup")
        {
            PrintOnlyIfDetail = false;
            column(ReportForNavId_4645; 4645) { } // Autogenerated by ForNav - Do not delete
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
            column(CurrReport_PAGENO; Format(ReportForNav.PageNo))
            {
            }
            column(UserId; UserId)
            {
            }
            column(Code_LoanProductsSetup; "Loan Products Setup".Code)
            {
            }
            column(ProductDescription_LoanProductsSetup; "Loan Products Setup"."Product Description")
            {
            }
            column(GLAccountNo; GLAccountNo)
            {
            }
            column(CurrDate; Format(CurrDate))
            {
            }
            column(ClosingBalPreviousDay; ClosingBalPreviousDay)
            {
            }
            column(ClosingBalToday; ClosingBalToday)
            {
            }
            column(PreviousDay; Format(PreviousDay))
            {
            }
            column(TotalDeposits; TotalDeposits)
            {
            }
            column(TotalWithdrawals; TotalWithdrawals)
            {
            }
            column(TransactedAccounts; TransactedAccounts)
            {
            }
            column(NoofLoanAccounts_LoanProductsSetup; "Loan Products Setup"."No of Loan Accounts")
            {
            }
            trigger OnAfterGetRecord();
            begin
                CurrDate := ASAT;
                PreviousDay := ASAT - 1;
                StartDate := 20170101D;
                TotalDeposits := 0;
                TotalWithdrawals := 0;
                CurrDateFilter := Format(StartDate) + '..' + Format(CurrDate);
                PrevDateFilter := Format(StartDate) + '..' + Format(PreviousDay);
                LoanType.Reset;
                LoanType.SetRange(LoanType.Code, Code);
                if LoanType.FindSet then begin
                    GLAccountNo := LoanType."Loan Account";
                    GLAccounts.Reset;
                    GLAccounts.SetRange(GLAccounts."No.", GLAccountNo);
                    GLAccounts.SetFilter(GLAccounts."Date Filter", CurrDateFilter);
                    if GLAccounts.FindSet then begin
                        GLAccounts.CalcFields(GLAccounts.Balance);
                        ClosingBalToday := GLAccounts.Balance;
                    end;
                    GLAccounts.Reset;
                    GLAccounts.SetRange(GLAccounts."No.", GLAccountNo);
                    GLAccounts.SetFilter(GLAccounts."Date Filter", PrevDateFilter);
                    if GLAccounts.FindSet then begin
                        GLAccounts.CalcFields(GLAccounts.Balance);
                        ClosingBalPreviousDay := GLAccounts.Balance;
                    end;
                    GLEntry.Reset;
                    GLEntry.SetRange(GLEntry."G/L Account No.", GLAccountNo);
                    GLEntry.SetRange(GLEntry."Posting Date", ASAT);
                    if GLEntry.FindSet then begin
                        if GLEntry.Amount < 0 then begin
                            TotalDeposits := TotalDeposits + GLEntry.Amount;
                        end else
                            TotalWithdrawals := TotalWithdrawals + GLEntry.Amount;
                        if GLEntry."Source No." <> GLEntries."Source No." then begin
                            TransactedAccounts := GLEntry.Count;
                        end;
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
                field("As At"; ASAT)
                {
                    ApplicationArea = Basic;
                }
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
        Company.Get();
        Company.CalcFields(Company.Picture);
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
        ;
        ReportsForNavPre;
    end;

    var
        Company: Record "Company Information";
        ClosingBalPreviousDay: Decimal;
        TotalDeposits: Decimal;
        TotalWithdrawals: Decimal;
        ClosingBalToday: Decimal;
        GLAccountNo: Code[20];
        VendorPostingGroups: Record "Vendor Posting Group";
        StartDate: Date;
        PreviousDay: Date;
        CurrDate: Date;
        GLAccounts: Record "G/L Account";
        CurrDateFilter: Text;
        PrevDateFilter: Text;
        GLEntry: Record "G/L Entry";
        ASAT: Date;
        TransactedAccounts: Integer;
        GLEntries: Record "G/L Entry";
        LoanType: Record "Loan Products Setup";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516909_v6_3_0_2259;
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
