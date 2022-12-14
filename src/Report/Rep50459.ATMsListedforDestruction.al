#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516459_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50459 "ATMs Listed for Destruction"
{
    RDLCLayout = 'Layouts/ATMsListedforDestruction.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("ATM Card Applications"; "ATM Card Applications")
        {
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
            column(VarEntryNo; VarEntryNo)
            {
            }
            column(No_ATMCardApplications; "ATM Card Applications"."No.")
            {
            }
            column(AccountNo_ATMCardApplications; "ATM Card Applications"."Account No")
            {
            }
            column(BranchCode_ATMCardApplications; "ATM Card Applications"."Branch Code")
            {
            }
            column(AccountName_ATMCardApplications; "ATM Card Applications"."Account Name")
            {
            }
            column(RequestType_ATMCardApplications; "ATM Card Applications"."Request Type")
            {
            }
            column(ApplicationDate_ATMCardApplications; Format("ATM Card Applications"."Application Date", 0, '<Day,2> <Month Text,3> <Year4>'))
            {
            }
            column(OrderATMCard_ATMCardApplications; "ATM Card Applications"."Order ATM Card")
            {
            }
            column(OrderedBy_ATMCardApplications; "ATM Card Applications"."Ordered By")
            {
            }
            column(OrderedOn_ATMCardApplications; Format("ATM Card Applications"."Ordered On", 0, '<Day,2> <Month Text,3> <Year4>'))
            {
            }
            column(CardReceived_ATMCardApplications; "ATM Card Applications"."Card Received")
            {
            }
            column(ReceivedBy_ATMCardApplications; "ATM Card Applications"."Card Received By")
            {
            }
            column(ReceivedOn_ATMCardApplications; Format("ATM Card Applications"."Card Received On", 0, '<Day,2> <Month Text,3> <Year4>'))
            {
            }
            column(VarAccountType; VarAccountType)
            {
            }
            column(VarDaysElapsedAfterReceipt; VarDaysElapsedAfterReceipt * -1)
            {
            }
            column(VarListedforDistruction; VarListedforDistruction)
            {
            }
            column(ListedForDestruction_ATMCardApplications; "ATM Card Applications"."Listed For Destruction")
            {
            }
            trigger OnPreDataItem();
            begin
                Company.Get();
                Company.CalcFields(Company.Picture);
            end;

            trigger OnAfterGetRecord();
            begin
                ObjGensetup.Get;
                ObjATMCardApplications.Reset;
                ObjATMCardApplications.SetRange(ObjATMCardApplications."No.", "No.");
                ObjATMCardApplications.SetRange(ObjATMCardApplications."Card Received", true);
                ObjATMCardApplications.SetRange(ObjATMCardApplications.Collected, false);
                if ObjATMCardApplications.FindSet then begin
                    if CalcDate(ObjGensetup."ATM Destruction Period", ObjATMCardApplications."Card Received On") < WorkDate then begin
                        VarListedforDistruction := true;
                        ObjATMCardApplications."Listed For Destruction" := true;
                        VarDaysElapsedAfterReceipt := ObjATMCardApplications."Card Received On" - WorkDate;
                        ObjATMCardApplications.Modify;
                        VarEntryNo := VarEntryNo + 1;
                    end;
                end;
                if ObjAccounts.Get("Account No") then begin
                    if ObjAccountType.Get(ObjAccounts."Account Type") then begin
                        VarAccountType := ObjAccountType.Description;
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
        AsAt: Date;
        Company: Record "Company Information";
        SFactory: Codeunit "SURESTEP Factory";
        ObjGensetup: Record "Sacco General Set-Up";
        CurrReport_PAGENOCaptionLbl: label 'Page';
        RISK_CLASSIFICATION_OF_ASSETS_AND_PROVISIONINGCaptionLbl: label 'RISK CLASSIFICATION OF ASSETS AND PROVISIONING';
        FORM_4CaptionLbl: label 'FORM 4';
        SASRA_2_004CaptionLbl: label 'SASRA 2/004';
        R__46_CaptionLbl: label 'R.(46)';
        ObjMembers: Record "Members Register";
        VarEntryNo: Integer;
        ObjDetailedVendLedger: Record "Detailed Vendor Ledg. Entry";
        VarReportDate: Date;
        VarLedgerDateFilter: Text;
        VarAccountTypeBalance: Decimal;
        ObjATMCardApplications: Record "ATM Card Applications";
        VarListedforDistruction: Boolean;
        VarAccountType: Code[50];
        ObjAccounts: Record Vendor;
        ObjAccountType: Record "Account Types-Saving Products";
        VarDaysElapsedAfterReceipt: Integer;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516459_v6_3_0_2259;
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
