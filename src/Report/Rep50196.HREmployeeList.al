#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516196_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50196 "HREmployee - List"
{
    Caption = 'Employee - List';
    RDLCLayout = './Layouts/HREmployee-List.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = "No.", "Search Name", "Department Code";
            column(ReportForNavId_7528; 7528) { } // Autogenerated by ForNav - Do not delete
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; Format(ReportForNav.PageNo))
            {
            }
            column(Employee_TABLECAPTION__________EmployeeFilter; TableCaption + ': ' + EmployeeFilter)
            {
            }
            column(EmployeeFilter; EmployeeFilter)
            {
            }
            column(Employee__No__; "HR Employees"."No.")
            {
            }
            column(FirstName_HREmployee; "HR Employees"."First Name")
            {
            }
            column(MiddleName_HREmployee; "HR Employees"."Middle Name")
            {
            }
            column(LastName_HREmployee; "HR Employees"."Last Name")
            {
            }
            column(Initials_HREmployee; "HR Employees".Initials)
            {
            }
            column(EmployeeAddr_1_; EmployeeAddr[1])
            {
            }
            column(EmployeeAddr_2_; EmployeeAddr[2])
            {
            }
            column(EmployeeAddr_3_; EmployeeAddr[3])
            {
            }
            column(EmployeeAddr_4_; EmployeeAddr[4])
            {
            }
            column(EmployeeAddr_5_; EmployeeAddr[5])
            {
            }
            column(EmployeeAddr_6_; EmployeeAddr[6])
            {
            }
            column(EmployeeAddr_7_; EmployeeAddr[7])
            {
            }
            column(Employee__Statistics_Group_Code_; "HR Employees"."Statistics Group Code")
            {
            }
            column(Employee__Employment_Date_; Format("Date Of Join"))
            {
            }
            column(Employee__Global_Dimension_1_Code_; "HR Employees"."Department Code")
            {
            }
            column(Employee__Global_Dimension_2_Code_; "HR Employees".Office)
            {
            }
            column(Employee__Last_Date_Modified_; Format("Last Date Modified"))
            {
            }
            column(Employee__Mobile_Phone_No__; "HR Employees"."Cellular Phone Number")
            {
            }
            column(Employee__E_Mail_; "HR Employees"."E-Mail")
            {
            }
            column(Employee__Phone_No__; "HR Employees"."Work Phone Number")
            {
            }
            column(EmployeeAddr_8_; EmployeeAddr[8])
            {
            }
            column(Employee_Extension; "HR Employees"."Ext.")
            {
            }
            column(GroupNo; GroupNo)
            {
            }
            column(Employee___ListCaption; Employee___ListCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee__No__Caption; FieldCaption("No."))
            {
            }
            column(Employee__Statistics_Group_Code_Caption; FieldCaption("Statistics Group Code"))
            {
            }
            column(Employee__Employment_Date_Caption; Employee__Employment_Date_CaptionLbl)
            {
            }
            column(Employee__Global_Dimension_1_Code_Caption; CaptionClassTranslate('1,1,1'))
            {
            }
            column(Employee__Global_Dimension_2_Code_Caption; CaptionClassTranslate('1,1,2'))
            {
            }
            column(Employee__Last_Date_Modified_Caption; Employee__Last_Date_Modified_CaptionLbl)
            {
            }
            column(Employee__Alt__Address_Code_Caption; "HR Employees"."Residential Address")
            {
            }
            column(Employee__Mobile_Phone_No__Caption; "HR Employees"."Cellular Phone Number")
            {
            }
            column(Employee__E_Mail_Caption; FieldCaption("E-Mail"))
            {
            }
            column(Employee__Phone_No__Caption; "HR Employees"."Home Phone Number")
            {
            }
            column(Employee_ExtensionCaption; "HR Employees"."Ext.")
            {
            }
            trigger OnAfterGetRecord();
            begin
                //FormatAddr.Employee(EmployeeAddr,"hr-Employee");
                if Counter = RecPerPageNum then begin
                    GroupNo := GroupNo + 1;
                    Counter := 0;
                end;
                Counter := Counter + 1;
            end;

        }
    }

    requestpage
    {

        SaveValues = true;

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
        EmployeeFilter := "HR Employees".GetFilters;
        Counter := 0;
        GroupNo := 1;
        RecPerPageNum := 2;
        ;
        ReportsForNavPre;
    end;

    var
        FormatAddr: Codeunit "Format Address";
        EmployeeFilter: Text[250];
        EmployeeAddr: array[8] of Text[50];
        Counter: Integer;
        RecPerPageNum: Integer;
        GroupNo: Integer;
        Employee___ListCaptionLbl: label 'Employee - List';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Employee__Employment_Date_CaptionLbl: label 'Employment Date';
        Employee__Last_Date_Modified_CaptionLbl: label 'Last Date Modified';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516196_v6_3_0_2259;
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
