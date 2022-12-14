#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516413_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50413 "Holiday Fund1"
{
    RDLCLayout = 'Layouts/HolidayFund1.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "No.", "Date Filter";
            column(ReportForNavId_4645; 4645) { } // Autogenerated by ForNav - Do not delete
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(Company_Address; Company.Address)
            {
            }
            column(Company_Address2; Company."Address 2")
            {
            }
            column(Company_PhoneNo; Company."Phone No.")
            {
            }
            column(Company_Email; Company."E-Mail")
            {
            }
            column(Company_Picture; Company.Picture)
            {
            }
            column(CurrReport_PAGENO; Format(ReportForNav.PageNo))
            {
            }
            column(UserId; UserId)
            {
            }
            column(No; Vendor."No.")
            {
            }
            column(Name; Vendor.Name)
            {
            }
            column(Personal_No; Vendor."Personal No.")
            {
            }
            column(Employer_No; Vendor."Employer Code")
            {
            }
            column(ID_No; Vendor."ID No.")
            {
            }
            trigger OnAfterGetRecord();
            begin
                BaldateTXT := '01/01/10..' + Format(Baldate);
                "Members Register".Reset;
                "Members Register".SetRange("Members Register"."No.", "No.");
                "Members Register".SetFilter("Members Register"."Date Filter", BaldateTXT);
                if "Members Register".Find('-') then begin
                    "Members Register".CalcFields("Members Register"."Current Shares", "Members Register"."Shares Retained", "Members Register"."Insurance Fund");
                end;
                //DivBal:= "Dividend Amount" *-1;
                //Balance6:=Balance6 + "Dividend Amount";
                RNo := RNo + 1;
                Modify;

                /*
				Loan.RESET;
				Loan.SETRANGE(Loan."Client Code","No.");
				IF Loan.FIND('-') THEN BEGIN
					REPEAT
						Loan."Company Code":="Company Code";
						Loan.MODIFY;
					UNTIL Loan.NEXT=0;
				END;
				Loan.RESET;
				Loan.SETRANGE(Loan."BOSA No","No.");
				IF Loan.FIND('-') THEN BEGIN
					REPEAT
						Loan."Company Code":="Company Code";
						Loan.MODIFY;
					UNTIL Loan.NEXT=0;
				END;
				*/

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
        /* IF "COMPY INFOR".GET THEN
         BEGIN
 "COMPY INFOR".CALCFIELDS("COMPY INFOR".Picture);
         NAME:="COMPY INFOR".Name;
         END;*/
        ;
        ReportsForNavPre;

    end;

    var
        RNo: Integer;
        BaldateTXT: Text[30];
        DivBal: Decimal;
        Loan: Record "HR Transport Requisition Pass";
        Balance6: Decimal;
        Company: Record "Company Information";
        Baldate: Date;
        "Members Register": Record "Members Register";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516413_v6_3_0_2259;
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
