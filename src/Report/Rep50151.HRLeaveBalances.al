#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516151_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50151 "HR Leave Balances"
{
    RDLCLayout = 'Layouts/HRLeaveBalances.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            DataItemTableView = where("Allocated Leave Days" = filter(> 0));
            RequestFilterFields = "No.";
            column(ReportForNavId_3725; 3725) { } // Autogenerated by ForNav - Do not delete
            column(No_HREmployees; "HR Employees"."No.")
            {
            }
            column(FirstName_HREmployees; "HR Employees"."First Name")
            {
            }
            column(MiddleName_HREmployees; "HR Employees"."Middle Name")
            {
            }
            column(LastName_HREmployees; "HR Employees"."Last Name")
            {
            }
            column(LeaveType_HREmployees; "HR Employees"."Leave Type")
            {
            }
            column(LeaveBalance_HREmployees; "HR Employees"."Leave Balance")
            {
            }
            column(TotalLeaveTaken_HREmployees; "HR Employees"."Total Leave Taken")
            {
            }
            column(TotalLeaveDays_HREmployees; "HR Employees"."Total (Leave Days)")
            {
            }
            column(ReimbursedLeaveDays_HREmployees; "HR Employees"."Reimbursed Leave Days")
            {
            }
            column(AllocatedLeaveDays_HREmployees; "HR Employees"."Allocated Leave Days")
            {
            }
            column(ComapnyName; CI.Name)
            {
            }
            column(CompanyAddress; CI.Address)
            {
            }
            column(CompanyPicture; CI.Picture)
            {
            }
            column(LeaveBalance; LeaveBalance)
            {
            }
            trigger OnAfterGetRecord();
            begin
                LeaveBalance := 0;
                LeaveBalance := "HR Employees"."Allocated Leave Days" + "HR Employees"."Total Leave Taken" + "HR Employees"."Reimbursed Leave Days";
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
        CI.Reset;
        CI.Get;
        CI.CalcFields(CI.Picture);
        ;
        ReportsForNavPre;
    end;

    var
        HR_Leave_ApplicationCaptionLbl: label 'HR Leave Application';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        CI: Record "Company Information";
        LeaveBalance: Decimal;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516151_v6_3_0_2259;
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
