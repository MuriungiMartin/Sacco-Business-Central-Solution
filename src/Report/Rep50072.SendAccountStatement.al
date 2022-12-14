#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516072_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50072 "Send Account Statement"
{
    RDLCLayout = 'Layouts/SendAccountStatement.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            RequestFilterFields = "No.", "Date Filter";
            column(ReportForNavId_1; 1) { } // Autogenerated by ForNav - Do not delete
            trigger OnAfterGetRecord();
            begin
                VarReportStartDate := Vendor.GetRangeMin(Vendor."Date Filter");
                VarReportToDate := Vendor.GetRangemax(Vendor."Date Filter");
                VarDateFilter := Vendor.GetFilter(Vendor."Date Filter");
                ObjVendor.Reset;
                ObjVendor.SetRange(ObjVendor."No.", Vendor."No.");
                ObjVendor.SetFilter(ObjVendor."Date Filter", VarDateFilter);
                if ObjVendor.FindSet then begin
                    SMTPSetup.Get;
                    Filename := '';
                    FilePath := '';
                    Filename := 'Account Statement - ' + ObjVendor."No." + '.pdf';
                    FilePath := SMTPSetup."Path to Save Report" + Filename;
                    Report.SaveAsPdf(Report::"FOSA Account Statement Ver.1.0", FilePath, ObjVendor);
                    ObjMember.Reset;
                    ObjMember.SetRange(ObjMember."No.", ObjVendor."BOSA Account No");
                    ObjMember.SetRange(ObjMember."Email Indemnified", true);
                    if ObjMember.FindSet then begin
                        VarMemberEmail := ObjMember."E-Mail";
                        VarMailSubject := 'Account Statement: ' + ObjVendor."No." + ' - ' +
                        Format(VarReportStartDate, 0, '<Day,2> <Month Text,3> <Year4>') + ' to ' +
                        Format(VarReportToDate, 0, '<Day,2> <Month Text,3> <Year4>');
                        VarMailBody := 'Kindly find attached your Account Statement for the period ' +
                        Format(VarReportStartDate, 0, '<Day,2> <Month Text,3> <Year4>') + ' to ' +
                        Format(VarReportToDate, 0, '<Day,2> <Month Text,3> <Year4>') + '. You can save, view or print the statement at your convenience.';
                        SFactory.FnSendStatementViaMail(ObjVendor.Name, VarMailSubject, VarMailBody, VarMemberEmail, Filename, '');
                        Message('The Account Statement for ' + ObjVendor."No." + ' has successfully been sent to ' + VarMemberEmail + '.');
                    end else
                        Message('The Email ' + VarMemberEmail + ' for Account Member No. ' + ObjMember."No." + ' is not indemnified');
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
        ;
        ReportsForNavPre;
    end;

    var
        VarReportStartDate: Date;
        VarDateFilter: Text;
        ObjVendor: Record Vendor;
        Filename: Text;
        FilePath: Text;
        VarMemberEmail: Text;
        VarMailSubject: Text;
        VarMailBody: Text;
        SFactory: Codeunit "SURESTEP Factory";
        SMTPSetup: Record "SMTP Mail Setup";
        VarReportToDate: Date;
        ObjMember: Record "Members Register";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516072_v6_3_0_2259;
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
