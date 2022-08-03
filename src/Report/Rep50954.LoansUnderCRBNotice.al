#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516954_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50954 "Loans Under CRB Notice"
{
    RDLCLayout = 'Layouts/LoansUnderCRBNotice.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Loans Register"; "Loans Register")
        {
            DataItemTableView = where("Loans Under CRB Notice" = filter(true));
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Loan  No.", "Loan Product Type", "Client Code", "Loan Disbursement Date";
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
            column(VarCount; VarCount)
            {
            }
            column(VarAmountinArrears; VarAmountinArrears)
            {
            }
            column(RepaymentStartDate_LoansRegister; "Loans Register"."Repayment Start Date")
            {
            }
            column(OutstandingBalance_LoansRegister; "Loans Register"."Outstanding Balance")
            {
            }
            column(LoanNo_LoansRegister; "Loans Register"."Loan  No.")
            {
            }
            column(ApplicationDate_LoansRegister; "Loans Register"."Application Date")
            {
            }
            column(LoanProductType_LoansRegister; "Loans Register"."Loan Product Type")
            {
            }
            column(ClientCode_LoansRegister; "Loans Register"."Client Code")
            {
            }
            column(RequestedAmount_LoansRegister; "Loans Register"."Requested Amount")
            {
            }
            column(ApprovedAmount_LoansRegister; "Loans Register"."Approved Amount")
            {
            }
            column(ClientName_LoansRegister; "Loans Register"."Client Name")
            {
            }
            column(IssuedDate_LoansRegister; Format("Loans Register"."Issued Date"))
            {
            }
            column(Installments_LoansRegister; "Loans Register".Installments)
            {
            }
            column(LoanDisbursementDate_LoansRegister; "Loans Register"."Loan Disbursement Date")
            {
            }
            column(DaysInArrears_LoansRegister; "Loans Register"."Days In Arrears")
            {
            }
            column(AmountinArrears_LoansRegister; "Loans Register"."Amount in Arrears")
            {
            }
            trigger OnAfterGetRecord();
            begin
                VarAmountinArrears := 0;
                VarCount := VarCount + 1;
                //SFactory.FnGetLoanArrearsAmountII("Loans Register"."Loan  No.");
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
        SFactory: Codeunit "SURESTEP Factory";
        VarAmountinArrears: Decimal;
        ObjRepaymentSchedule: Record "Loan Repayment Schedule";
        VarCount: Integer;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516954_v6_3_0_2259;
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
