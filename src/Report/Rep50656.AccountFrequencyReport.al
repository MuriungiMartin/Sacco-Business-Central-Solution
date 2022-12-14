#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516656_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50656 "Account Frequency Report"
{
    RDLCLayout = 'Layouts/AccountFrequencyReport.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(glaccounts; "Control Cues")
        {
            DataItemTableView = where(Activity = filter("G/L"));
            RequestFilterFields = User_Accessed, Account_no;
            column(ReportForNavId_1000000000; 1000000000) { } // Autogenerated by ForNav - Do not delete
            column(Time_glaccounts; glaccounts.time)
            {
            }
            column(Date_glaccounts; glaccounts.date)
            {
            }
            column(UserAccessed_glaccounts; glaccounts.User_Accessed)
            {
            }
            column(FrequencyToday_glaccounts; glaccounts.Frequency_Today)
            {
            }
            column(Activity_glaccounts; glaccounts.Activity)
            {
            }
            column(AccountName_glaccounts; glaccounts.Account_Name)
            {
            }
            column(Accountno_glaccounts; glaccounts.Account_no)
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
            column(UserId; UserId)
            {
            }
            column(VarGLName; VarGLName)
            {
            }
            trigger OnPreDataItem();
            begin
                Company.Get();
                Company.CalcFields(Picture);
            end;

            trigger OnAfterGetRecord();
            begin
                if glaccounts.Activity = glaccounts.Activity::"G/L" then begin
                    if ObjGLAccounts.Get(glaccounts.Account_no) then
                        VarGLName := ObjGLAccounts.Name
                end;
            end;

        }
        dataitem(BOSAAccounts; "Control Cues")
        {
            DataItemTableView = where(Activity = filter(BOSA));
            RequestFilterFields = User_Accessed, date;
            column(ReportForNavId_1000000006; 1000000006) { } // Autogenerated by ForNav - Do not delete
            column(Accountno_BOSAAccounts; BOSAAccounts.Account_no)
            {
            }
            column(Activity_BOSAAccounts; BOSAAccounts.Activity)
            {
            }
            column(FrequencyToday_BOSAAccounts; BOSAAccounts.Frequency_Today)
            {
            }
            column(UserAccessed_BOSAAccounts; BOSAAccounts.User_Accessed)
            {
            }
            column(Date_BOSAAccounts; BOSAAccounts.date)
            {
            }
            column(AccountName_BOSAAccounts; BOSAAccounts.Account_Name)
            {
            }
            column(Time_BOSAAccounts; BOSAAccounts.time)
            {
            }
            column(VarMemberName; VarMemberName)
            {
            }
            trigger OnAfterGetRecord();
            begin
                if BOSAAccounts.Activity = BOSAAccounts.Activity::BOSA then begin
                    if ObjMember.Get(BOSAAccounts.Account_no) then
                        VarMemberName := ObjMember.Name
                end;
            end;

        }
        dataitem(FOSAAccounts; "Control Cues")
        {
            DataItemTableView = where(Activity = filter(FOSA));
            RequestFilterFields = User_Accessed, Account_no;
            column(ReportForNavId_1000000012; 1000000012) { } // Autogenerated by ForNav - Do not delete
            column(FrequencyToday_FOSAAccounts; FOSAAccounts.Frequency_Today)
            {
            }
            column(UserAccessed_FOSAAccounts; FOSAAccounts.User_Accessed)
            {
            }
            column(Date_FOSAAccounts; FOSAAccounts.date)
            {
            }
            column(Time_FOSAAccounts; FOSAAccounts.time)
            {
            }
            column(AccountName_FOSAAccounts; FOSAAccounts.Account_Name)
            {
            }
            column(Accountno_FOSAAccounts; FOSAAccounts.Account_no)
            {
            }
            column(Activity_FOSAAccounts; FOSAAccounts.Activity)
            {
            }
            column(VarFOSAName; VarFOSAName)
            {
            }
            trigger OnAfterGetRecord();
            begin
                if FOSAAccounts.Activity = FOSAAccounts.Activity::FOSA then begin
                    if ObjAccounts.Get(FOSAAccounts.Account_no) then
                        VarFOSAName := ObjAccounts.Name
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
        Company: Record "Company Information";
        ObjGLAccounts: Record "G/L Account";
        ObjMember: Record "Members Register";
        ObjAccounts: Record Vendor;
        VarGLName: Text;
        VarMemberName: Text;
        VarFOSAName: Text;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516656_v6_3_0_2259;
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
