#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516015_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50625 "Outstanding IOU Report"
{
    RDLCLayout = 'Layouts/OutstandingIOUReport.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Imprest Header"; "Imprest Header")
        {
            //DataItemTableView = where(Status=const("4"),"Surrender Status"=const(" "));
            RequestFilterFields = Date, "Responsibility Center";
            column(ReportForNavId_1102755000; 1102755000) { } // Autogenerated by ForNav - Do not delete
            column(No_StaffAdvanceHeader; "Imprest Header"."No.")
            {
            }
            column(Date_StaffAdvanceHeader; "Imprest Header".Date)
            {
            }
            column(CurrencyCode_StaffAdvanceHeader; "Imprest Header"."Currency Code")
            {
            }
            column(Payee_StaffAdvanceHeader; "Imprest Header".Payee)
            {
            }
            column(OnBehalfOf_StaffAdvanceHeader; "Imprest Header"."On Behalf Of")
            {
            }
            column(Cashier_StaffAdvanceHeader; "Imprest Header".Cashier)
            {
            }
            column(Posted_StaffAdvanceHeader; "Imprest Header".Posted)
            {
            }
            column(DatePosted_StaffAdvanceHeader; "Imprest Header"."Date Posted")
            {
            }
            column(TimePosted_StaffAdvanceHeader; "Imprest Header"."Time Posted")
            {
            }
            column(PostedBy_StaffAdvanceHeader; "Imprest Header"."Posted By")
            {
            }
            column(TotalPaymentAmount_StaffAdvanceHeader; "Imprest Header"."Total Payment Amount")
            {
            }
            column(PayingBankAccount_StaffAdvanceHeader; "Imprest Header"."Paying Bank Account")
            {
            }
            column(TotalVATAmount_StaffAdvanceHeader; "Imprest Header"."Total VAT Amount")
            {
            }
            column(TotalWitholdingTaxAmount_StaffAdvanceHeader; "Imprest Header"."Total Witholding Tax Amount")
            {
            }
            column(TotalNetAmount_StaffAdvanceHeader; "Imprest Header"."Total Net Amount")
            {
            }
            column(TotalNetAmountLCY_StaffAdvanceHeader; "Imprest Header"."Total Net Amount LCY")
            {
            }
            column(Purpose_StaffAdvanceHeader; "Imprest Header".Purpose)
            {
            }
            column(AccountType_StaffAdvanceHeader; "Imprest Header"."Account Type")
            {
            }
            column(AccountNo_StaffAdvanceHeader; "Imprest Header"."Account No.")
            {
            }
            column(ComapnyName; CompanyInfo.Name)
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(RemainingAmount; RemainingAmount)
            {
            }
            trigger OnAfterGetRecord();
            begin
                CustLedger.Reset;
                CustLedger.SetRange(CustLedger."Customer No.", "Account No.");
                //CustLedger.SETRANGE(CustLedger."Posting Date","Staff Advance Header"."Date Posted");
                CustLedger.SetRange(CustLedger."Document No.", "No.");
                if CustLedger.FindFirst then begin
                    CustLedger.CalcFields("Remaining Amount");
                    RemainingAmount := CustLedger."Remaining Amount";
                end
                else
                    RemainingAmount := 0;
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
        ;
        ReportsForNavPre;
    end;

    var
        CompanyInfo: Record "Company Information";
        RemainingAmount: Decimal;
        CustLedger: Record "Cust. Ledger Entry";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516015_v6_3_0_2259;
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
