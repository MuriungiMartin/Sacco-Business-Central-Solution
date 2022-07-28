#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516914_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50914 "Checkoff Report"
{
    RDLCLayout = './Layouts/CheckoffReport.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Checkoff Header-Distributed"; "Checkoff Header-Distributed")
        {
            column(ReportForNavId_1000000000; 1000000000) { } // Autogenerated by ForNav - Do not delete
            column(CI_Name; CI.Name)
            {
                IncludeCaption = true;
            }
            column(CI_Address; CI.Address)
            {
                IncludeCaption = true;
            }
            column(CI_Address2; CI."Address 2")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
            }
            column(DOCNAME; DOCNAME)
            {
            }
            column(Amount_CheckoffHeaderDistributed; "Checkoff Header-Distributed".Amount)
            {
            }
            column(AccountType_CheckoffHeaderDistributed; "Checkoff Header-Distributed"."Account Type")
            {
            }
            column(AccountNo_CheckoffHeaderDistributed; "Checkoff Header-Distributed"."Account No")
            {
            }
            column(No_CheckoffHeaderDistributed; "Checkoff Header-Distributed".No)
            {
            }
            column(DocumentNo_CheckoffHeaderDistributed; "Checkoff Header-Distributed"."Document No")
            {
            }
            column(Remarks_CheckoffHeaderDistributed; "Checkoff Header-Distributed".Remarks)
            {
            }
            column(DateEntered_CheckoffHeaderDistributed; Format("Checkoff Header-Distributed"."Date Entered"))
            {
            }
            column(NumberText_1_; NumberText[1])
            {
            }
            dataitem("Checkoff Lines-Distributed"; "Checkoff Lines-Distributed")
            {
                DataItemLink = "VS-MEMBER" = field(No);
                column(ReportForNavId_1000000001; 1000000001) { } // Autogenerated by ForNav - Do not delete
                column(StaffPayrollNo_CheckoffLinesDistributed; "Checkoff Lines-Distributed"."Payroll No")
                {
                }
                column(Amount_CheckoffLinesDistributed; "Checkoff Lines-Distributed"."Employee Name")
                {
                }
                column(NoRepayment_CheckoffLinesDistributed; "Checkoff Lines-Distributed"."Member No")
                {
                }
                column(StaffNotFound_CheckoffLinesDistributed; "Checkoff Lines-Distributed"."Checkoff No")
                {
                }
                column(DateFilter_CheckoffLinesDistributed; "Checkoff Lines-Distributed".Deposits)
                {
                }
                column(TransactionDate_CheckoffLinesDistributed; "Checkoff Lines-Distributed".DL_P)
                {
                }
                column(EntryNo_CheckoffLinesDistributed; "Checkoff Lines-Distributed".DL_I)
                {
                }
                column(Generated_CheckoffLinesDistributed; "Checkoff Lines-Distributed".EL_P)
                {
                }
                column(PaymentNo_CheckoffLinesDistributed; "Checkoff Lines-Distributed".EL_I)
                {
                }
                column(Posted_CheckoffLinesDistributed; "Checkoff Lines-Distributed".EMER_P)
                {
                }
                column(MultipleReceipts_CheckoffLinesDistributed; "Checkoff Lines-Distributed".EMER_I)
                {
                }
                column(Name_CheckoffLinesDistributed; "Checkoff Lines-Distributed".IL_P)
                {
                }
                column(EarlyRemitances_CheckoffLinesDistributed; "Checkoff Lines-Distributed".IL_I)
                {
                }
                column(EarlyRemitanceAmount_CheckoffLinesDistributed; "Checkoff Lines-Distributed".MSL_P)
                {
                }
                column(LoanNo_CheckoffLinesDistributed; "Checkoff Lines-Distributed".MSL_I)
                {
                }
                column(MemberNo_CheckoffLinesDistributed; "Checkoff Lines-Distributed".INSURANCE)
                {
                }
                column(Interest_CheckoffLinesDistributed; "Checkoff Lines-Distributed"."SILVER SAVINGS")
                {
                }
                column(LoanType_CheckoffLinesDistributed; "Checkoff Lines-Distributed".THIRDPARTY)
                {
                }
                column(DEPT_CheckoffLinesDistributed; "Checkoff Lines-Distributed".BENEVOLENT)
                {
                }
                column(ExpectedAmount_CheckoffLinesDistributed; "Checkoff Lines-Distributed".SFL_P)
                {
                }
                column(FOSAAccount_CheckoffLinesDistributed; "Checkoff Lines-Distributed".SFL_I)
                {
                }
                column(UtilityType_CheckoffLinesDistributed; "Checkoff Lines-Distributed".PHONE_P)
                {
                }
                column(TransactionType_CheckoffLinesDistributed; "Checkoff Lines-Distributed".PHONE_I)
                {
                }
                column(Reference_CheckoffLinesDistributed; "Checkoff Lines-Distributed".SPL_P)
                {
                }
                column(Accounttype_CheckoffLinesDistributed; "Checkoff Lines-Distributed".SPL_I)
                {
                }
                column(Variance_CheckoffLinesDistributed; "Checkoff Lines-Distributed".SHARES)
                {
                }
                column(EmployerCode_CheckoffLinesDistributed; "Checkoff Lines-Distributed".TOTAL_DISTRIBUTED)
                {
                }
                column(GPersonalNo_CheckoffLinesDistributed; "Checkoff Lines-Distributed"."ID No")
                {
                }
                column(Gnames_CheckoffLinesDistributed; "Checkoff Lines-Distributed".SSFL_P)
                {
                }
                column(Gnumber_CheckoffLinesDistributed; "Checkoff Lines-Distributed".SSFL_I)
                {
                }
                column(Userid1_CheckoffLinesDistributed; "Checkoff Lines-Distributed".TL_P)
                {
                }
                column(LoansNotfound_CheckoffLinesDistributed; "Checkoff Lines-Distributed".TL_I)
                {
                }
                column(ReceiptHeaderNo_CheckoffLinesDistributed; "Checkoff Lines-Distributed"."VS-MEMBER")
                {
                }
                column(UnallocatedFund_CheckoffLinesDistributed; "Checkoff Lines-Distributed".DL)
                {
                }
                column(PostingDate_CheckoffLinesDistributed; "Checkoff Lines-Distributed".EL)
                {
                }
                column(DocumentNo_CheckoffLinesDistributed; "Checkoff Lines-Distributed".IL)
                {
                }
                column(LedgerFound_CheckoffLinesDistributed; "Checkoff Lines-Distributed".MSL)
                {
                }
            }
            trigger OnPreDataItem();
            begin
                CI.Get();
                CI.CalcFields(CI.Picture);
            end;

            trigger OnAfterGetRecord();
            begin
                //"Checkoff Header-Distributed".CALCFIELDS("Checkoff Header-Distributed".Amount);
                CheckReport.InitTextVariable();
                CheckReport.FormatNoText(NumberText, "Checkoff Header-Distributed".Amount, ' ');
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
        CI.Get();
        CI.CalcFields(CI.Picture);
        ;
        ReportsForNavPre;
    end;

    var
        StrCopyText: Text[30];
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        DimVal: Record "Dimension Value";
        DimValName: Text[30];
        TTotal: Decimal;
        CheckReport: Report Check;
        NumberText: array[2] of Text[80];
        STotal: Decimal;
        InvoiceCurrCode: Code[10];
        CurrCode: Code[10];
        GLSetup: Record "General Ledger Setup";
        DOCNAME: Text[30];
        VATCaptionLbl: label 'VAT';
        PAYMENT_DETAILSCaptionLbl: label 'PAYMENT DETAILS';
        AMOUNTCaptionLbl: label 'AMOUNT';
        NET_AMOUNTCaptionLbl: label 'AMOUNT';
        W_TAXCaptionLbl: label 'W/TAX';
        Document_No___CaptionLbl: label 'Document No. :';
        Currency_CaptionLbl: label 'Currency:';
        Payment_To_CaptionLbl: label 'Payment To:';
        Document_Date_CaptionLbl: label 'Document Date:';
        Cheque_No__CaptionLbl: label 'Cheque No.:';
        R_CENTERCaptionLbl: label 'R.CENTER CODE';
        PROJECTCaptionLbl: label 'PROJECT CODE';
        TotalCaptionLbl: label 'Total';
        Printed_By_CaptionLbl: label 'Printed By:';
        Amount_in_wordsCaptionLbl: label 'Amount in words';
        EmptyStringCaptionLbl: label '================================================================================================================================================================================================';
        EmptyStringCaption_Control1102755013Lbl: label '================================================================================================================================================================================================';
        Amount_in_wordsCaption_Control1102755021Lbl: label 'Amount in words';
        Printed_By_Caption_Control1102755026Lbl: label 'Printed By:';
        TotalCaption_Control1102755033Lbl: label 'Total';
        Signature_CaptionLbl: label 'Signature:';
        Date_CaptionLbl: label 'Date:';
        Name_CaptionLbl: label 'Name:';
        RecipientCaptionLbl: label 'Recipient';
        CompanyInfo: Record "Company Information";
        BudgetLbl: label 'Budget';
        CreationDoc: Boolean;
        DtldVendEntry: Record "Detailed Vendor Ledg. Entry";
        InvNo: Code[20];
        InvAmt: Decimal;
        ApplyEnt: Record "Vendor Ledger Entry";
        VendEnrty: Record "Vendor Ledger Entry";
        CI: Record "Company Information";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516914_v6_3_0_2259;
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
