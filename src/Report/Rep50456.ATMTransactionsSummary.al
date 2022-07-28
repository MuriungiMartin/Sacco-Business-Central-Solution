#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516456_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50456 "ATM Transactions Summary"
{
    RDLCLayout = './Layouts/ATMTransactionsSummary.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("ATM Transactions"; "ATM Transactions")
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
            column(VarATMWithdrawalMonth1Count; VarATMWithdrawalMonth1Count)
            {
            }
            column(VarATMWithdrawalMonth2Count; VarATMWithdrawalMonth2Count)
            {
            }
            column(VarATMWithdrawalMonth3Count; VarATMWithdrawalMonth3Count)
            {
            }
            column(VarVISAPOSPurchaseMonth1Count; VarVISAPOSPurchaseMonth1Count)
            {
            }
            column(VarVISAPOSPurchaseMonth2Count; VarVISAPOSPurchaseMonth2Count)
            {
            }
            column(VarVISAPOSPurchaseMonth3Count; VarVISAPOSPurchaseMonth3Count)
            {
            }
            column(VarPOSWithdrawalAgentMonth1Count; VarPOSWithdrawalAgentMonth1Count)
            {
            }
            column(VarPOSWithdrawalAgentMonth2Count; VarPOSWithdrawalAgentMonth2Count)
            {
            }
            column(VarPOSWithdrawalAgentMonth3Count; VarPOSWithdrawalAgentMonth3Count)
            {
            }
            column(VarPOSBalanceEquiryMonth1Count; VarPOSBalanceEquiryMonth1Count)
            {
            }
            column(VarPOSBalanceEquiryMonth2Count; VarPOSBalanceEquiryMonth2Count)
            {
            }
            column(VarPOSBalanceEquiryMonth3Count; VarPOSBalanceEquiryMonth3Count)
            {
            }
            column(VarPOSDepositMonth1Count; VarPOSDepositMonth1Count)
            {
            }
            column(VarPOSDepositMonth2Count; VarPOSDepositMonth2Count)
            {
            }
            column(VarPOSDepositMonth3Count; VarPOSDepositMonth3Count)
            {
            }
            column(VarVISAATMWithdrawalMonth1Count; VarVISAATMWithdrawalMonth1Count)
            {
            }
            column(VarVISAATMWithdrawalMonth2Count; VarVISAATMWithdrawalMonth2Count)
            {
            }
            column(VarVISAATMWithdrawalMonth3Count; VarVISAATMWithdrawalMonth3Count)
            {
            }
            column(VarPOSWithdrawalCoopBranchMonth1Count; VarPOSWithdrawalCoopBranchMonth1Count)
            {
            }
            column(VarPOSWithdrawalCoopBranchMonth2Count; VarPOSWithdrawalCoopBranchMonth2Count)
            {
            }
            column(VarPOSWithdrawalCoopBranchMonth3Count; VarPOSWithdrawalCoopBranchMonth3Count)
            {
            }
            column(VarATMCardlessWithdrawalMonth1Count; VarATMCardlessWithdrawalMonth1Count)
            {
            }
            column(VarATMCardlessWithdrawalMonth2Count; VarATMCardlessWithdrawalMonth2Count)
            {
            }
            column(VarATMCardlessWithdrawalMonth3Count; VarATMCardlessWithdrawalMonth3Count)
            {
            }
            column(VarPOSMinistatementMonth1Count; VarPOSMinistatementMonth1Count)
            {
            }
            column(VarPOSMinistatementMonth2Count; VarPOSMinistatementMonth2Count)
            {
            }
            column(VarPOSMinistatementMonth3Count; VarPOSMinistatementMonth3Count)
            {
            }
            column(VarMonth1MonthYear; VarMonth1MonthYear)
            {
            }
            column(VarMonth2MonthYear; VarMonth2MonthYear)
            {
            }
            column(VarMonth3MonthYear; VarMonth3MonthYear)
            {
            }
            trigger OnPreDataItem();
            begin
                Company.Get();
                Company.CalcFields(Company.Picture);
            end;

            trigger OnAfterGetRecord();
            begin
                VarMonth1DateFilter := Format(VarReportStartDate) + '..' + Format(CalcDate('1M', VarReportStartDate));
                VarMonth2DateFilter := Format(CalcDate('1M', VarReportStartDate)) + '..' + Format(CalcDate('2M', VarReportStartDate));
                VarMonth3DateFilter := Format(CalcDate('2M', VarReportStartDate)) + '..' + Format(CalcDate('3M', VarReportStartDate));
                VarMonth1MonthYear := Format(VarReportStartDate, 0, '<Month Text,3> <Year4>');
                VarMonth2MonthYear := Format(CalcDate('1M', VarReportStartDate), 0, '<Month Text,3> <Year4>');
                VarMonth3MonthYear := Format(CalcDate('2M', VarReportStartDate), 0, '<Month Text,3> <Year4>');
                //====================================================================================================================ATM WITHDRAWALS
                //===============================================Month 1
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1|%2', ObjATMTransactions."transaction type charges"::"Cash Withdrawal - Coop ATM",
                ObjATMTransactions."transaction type charges"::"Cash Withdrawal - FB ATM");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth1DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarATMWithdrawalMonth1Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 2
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1|%2|%3', ObjATMTransactions."transaction type charges"::"Cash Withdrawal - Coop ATM",
                ObjATMTransactions."transaction type charges"::"Cash Withdrawal - FB ATM", ObjATMTransactions."transaction type charges"::"Cash Withdrawal - VISA ATM");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth2DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarATMWithdrawalMonth2Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 3
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1|%2|%3', ObjATMTransactions."transaction type charges"::"Cash Withdrawal - Coop ATM",
                ObjATMTransactions."transaction type charges"::"Cash Withdrawal - FB ATM", ObjATMTransactions."transaction type charges"::"Cash Withdrawal - VISA ATM");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth3DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarATMWithdrawalMonth3Count := ObjATMTransactions.Count;
                end;
                //====================================================================================================================VISA POS PURCHASE
                //===============================================Month 1
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Normal Purchase");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth1DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarVISAPOSPurchaseMonth1Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 2
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Normal Purchase");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth2DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarVISAPOSPurchaseMonth2Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 3
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Normal Purchase");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth3DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarVISAPOSPurchaseMonth3Count := ObjATMTransactions.Count;
                end;
                //====================================================================================================================POS WITHDRAWAL AT AGENT
                //===============================================Month 1
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Cash Withdrawal");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth1DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarPOSWithdrawalAgentMonth1Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 2
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Cash Withdrawal");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth2DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarPOSWithdrawalAgentMonth2Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 3
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Cash Withdrawal");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth3DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarPOSWithdrawalAgentMonth3Count := ObjATMTransactions.Count;
                end;
                //====================================================================================================================POS BALANCE ENQUIRY
                //===============================================Month 1
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Balance Enquiry");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth1DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarPOSBalanceEquiryMonth1Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 2
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Balance Enquiry");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth2DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarPOSBalanceEquiryMonth2Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 3
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Balance Enquiry");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth3DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarPOSBalanceEquiryMonth3Count := ObjATMTransactions.Count;
                end;
                //====================================================================================================================POS DEPOSITS
                //===============================================Month 1
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Cash Deposit");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth1DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarPOSDepositMonth1Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 2
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Cash Deposit");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth2DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarPOSDepositMonth2Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 3
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Cash Deposit");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth3DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarPOSDepositMonth3Count := ObjATMTransactions.Count;
                end;
                //====================================================================================================================VISA ATM WITHDRAWAL
                //===============================================Month 1
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"Cash Withdrawal - VISA ATM");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth1DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarVISAATMWithdrawalMonth1Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 2
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"Cash Withdrawal - VISA ATM");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth2DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarVISAATMWithdrawalMonth2Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 3
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"Cash Withdrawal - VISA ATM");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth3DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarVISAATMWithdrawalMonth3Count := ObjATMTransactions.Count;
                end;
                //====================================================================================================================POS WITHDRAWAL COOP BRANCH
                //===============================================Month 1
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Benefit Cash Withdrawal");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth1DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarPOSWithdrawalCoopBranchMonth1Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 2
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Benefit Cash Withdrawal");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth2DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarPOSWithdrawalCoopBranchMonth2Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 3
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Benefit Cash Withdrawal");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth3DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarPOSWithdrawalCoopBranchMonth2Count := ObjATMTransactions.Count;
                end;
                //====================================================================================================================ATM CARDLESS WITHDRAWAL
                //===============================================Month 1
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - M Banking");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth1DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarATMCardlessWithdrawalMonth1Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 2
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - M Banking");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth2DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarATMCardlessWithdrawalMonth2Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 3
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - M Banking");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth3DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarATMCardlessWithdrawalMonth3Count := ObjATMTransactions.Count;
                end;
                //====================================================================================================================POS MINI STATEMENT
                //===============================================Month 1
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Mini Statement");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth1DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarPOSMinistatementMonth1Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 2
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Mini Statement");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth2DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarPOSMinistatementMonth2Count := ObjATMTransactions.Count;
                end;
                //===============================================Month 3
                ObjATMTransactions.Reset;
                ObjATMTransactions.SetFilter(ObjATMTransactions."Transaction Type Charges", '%1', ObjATMTransactions."transaction type charges"::"POS - Mini Statement");
                ObjATMTransactions.SetFilter(ObjATMTransactions."Posting Date", VarMonth3DateFilter);
                if ObjATMTransactions.FindSet then begin
                    VarPOSMinistatementMonth3Count := ObjATMTransactions.Count;
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
                field(VarReportStartDate; VarReportStartDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Report Start Date';
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
        VarATMWithdrawalMonth1Count: Integer;
        VarATMWithdrawalMonth2Count: Integer;
        VarATMWithdrawalMonth3Count: Integer;
        VarVISAPOSPurchaseMonth1Count: Integer;
        VarVISAPOSPurchaseMonth2Count: Integer;
        VarVISAPOSPurchaseMonth3Count: Integer;
        VarPOSWithdrawalAgentMonth1Count: Integer;
        VarPOSWithdrawalAgentMonth2Count: Integer;
        VarPOSWithdrawalAgentMonth3Count: Integer;
        VarPOSBalanceEquiryMonth1Count: Integer;
        VarPOSBalanceEquiryMonth2Count: Integer;
        VarPOSBalanceEquiryMonth3Count: Integer;
        VarPOSDepositMonth1Count: Integer;
        VarPOSDepositMonth2Count: Integer;
        VarPOSDepositMonth3Count: Integer;
        VarVISAATMWithdrawalMonth1Count: Integer;
        VarVISAATMWithdrawalMonth2Count: Integer;
        VarVISAATMWithdrawalMonth3Count: Integer;
        VarPOSWithdrawalCoopBranchMonth1Count: Integer;
        VarPOSWithdrawalCoopBranchMonth2Count: Integer;
        VarPOSWithdrawalCoopBranchMonth3Count: Integer;
        VarATMCardlessWithdrawalMonth1Count: Integer;
        VarATMCardlessWithdrawalMonth2Count: Integer;
        VarATMCardlessWithdrawalMonth3Count: Integer;
        VarPOSMinistatementMonth1Count: Integer;
        VarPOSMinistatementMonth2Count: Integer;
        VarPOSMinistatementMonth3Count: Integer;
        VarMonth1DateFilter: Text;
        VarMonth2DateFilter: Text;
        VarMonth3DateFilter: Text;
        VarReportStartDate: Date;
        ObjATMTransactions: Record "ATM Transactions";
        VarMonth1MonthYear: Text;
        VarMonth2MonthYear: Text;
        VarMonth3MonthYear: Text;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516456_v6_3_0_2259;
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
