#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516149_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50149 "Cashiers Transactions Ver1"
{
    Caption = 'Cashier Daily Transactions';
    RDLCLayout = 'Layouts/CashiersTransactionsVer1.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Bank Account"; "Bank Account")
        {
            DataItemTableView = sorting("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Name", "Bank Acc. Posting Group", "Date Filter";
            column(ReportForNavId_4558; 4558) { } // Autogenerated by ForNav - Do not delete
            column(FilterPeriod_BankAccLedg; StrSubstNo(Text000, DateFilter_BankAccount))
            {
            }
            column(CompanyName; CompanyProperty.DisplayName)
            {
            }
            column(ExcludeBalanceOnly; ExcludeBalanceOnly)
            {
            }
            column(BankAccFilter; BankAccFilter)
            {
            }
            column(StartBalanceLCY; StartBalanceLCY)
            {
            }
            column(StartBalance; StartBalance)
            {
            }
            column(PrintOnlyOnePerPage; PrintOnlyOnePerPage)
            {
            }
            column(ReportFilter; StrSubstNo('%1: %2', TableCaption, BankAccFilter))
            {
            }
            column(No_BankAccount; "Bank Account"."No.")
            {
            }
            column(Name_BankAccount; "Bank Account".Name)
            {
            }
            column(PhNo_BankAccount; "Bank Account"."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CurrencyCode_BankAccount; "Bank Account"."Currency Code")
            {
                IncludeCaption = true;
            }
            column(StartBalance2; StartBalance)
            {
                AutoFormatExpression = "Bank Account Ledger Entry"."Currency Code";
                AutoFormatType = 1;
            }
            column(BankAccDetailTrialBalCap; BankAccDetailTrialBalCapLbl)
            {
            }
            column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
            {
            }
            column(RepInclBankAcchavingBal; RepInclBankAcchavingBalLbl)
            {
            }
            column(BankAccLedgPostingDateCaption; BankAccLedgPostingDateCaptionLbl)
            {
            }
            column(BankAccBalanceCaption; BankAccBalanceCaptionLbl)
            {
            }
            column(OpenFormatCaption; OpenFormatCaptionLbl)
            {
            }
            column(BankAccBalanceLCYCaption; BankAccBalanceLCYCaptionLbl)
            {
            }
            dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = field("No."), "Posting Date" = field("Date Filter"), "Global Dimension 2 Code" = field("Global Dimension 2 Filter"), "Global Dimension 1 Code" = field("Global Dimension 1 Filter");
                DataItemTableView = sorting("Bank Account No.", "Posting Date");
                column(ReportForNavId_4920; 4920) { } // Autogenerated by ForNav - Do not delete
                column(PostingDate_BankAccLedg; Format("Posting Date"))
                {
                }
                column(DocType_BankAccLedg; "Bank Account Ledger Entry"."Document Type")
                {
                    IncludeCaption = true;
                }
                column(DocNo_BankAccLedg; "Bank Account Ledger Entry"."Document No.")
                {
                    IncludeCaption = true;
                }
                column(Desc_BankAccLedg; "Bank Account Ledger Entry".Description)
                {
                    IncludeCaption = true;
                }
                column(BankAccBalance; BankAccBalance)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(RemaningAmt_BankAccLedg; "Bank Account Ledger Entry"."Remaining Amount")
                {
                    IncludeCaption = true;
                }
                column(EntryNo_BankAccLedg; "Bank Account Ledger Entry"."Entry No.")
                {
                    IncludeCaption = true;
                }
                column(OpenFormat; Format(Open))
                {
                    //OptionCaption = 'Open';
                }
                column(Amount_BankAccLedg; "Bank Account Ledger Entry".Amount)
                {
                    IncludeCaption = true;
                }
                column(EntryAmtLcy_BankAccLedg; "Amount (LCY)")
                {
                    IncludeCaption = true;
                }
                column(BankAccBalanceLCY; BankAccBalanceLCY)
                {
                    AutoFormatType = 1;
                }
                column(ContinuedCaption; ContinuedCaptionLbl)
                {
                }
                column(DebitAmount_BankAccountLedgerEntry; "Bank Account Ledger Entry"."Debit Amount")
                {
                }
                column(CreditAmount_BankAccountLedgerEntry; "Bank Account Ledger Entry"."Credit Amount")
                {
                }
                trigger OnPreDataItem();
                begin
                    BankAccLedgEntryExists := false;

                end;

                trigger OnAfterGetRecord();
                begin
                    /*IF NOT PrintReversedEntries AND Reversed THEN
					  CurrReport.SKIP;*/
                    BankAccLedgEntryExists := true;
                    BankAccBalance := BankAccBalance + Amount;
                    BankAccBalanceLCY := BankAccBalanceLCY + "Amount (LCY)"

                end;

            }
            dataitem(Integer; Integer)
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                column(ReportForNavId_5444; 5444) { } // Autogenerated by ForNav - Do not delete
                column(StartBalanceLCY2; StartBalanceLCY)
                {
                }
                trigger OnAfterGetRecord();
                begin
                    if not BankAccLedgEntryExists and ((StartBalance = 0) or ExcludeBalanceOnly) then begin
                        StartBalanceLCY := 0;
                        CurrReport.Skip;
                    end;
                end;

            }
            dataitem(Transactions; Transactions)
            {
                DataItemLink = "Transaction Date" = field("Date Filter"), Cashier = field(CashierID);
                DataItemTableView = sorting(No) where("Type _Transactions" = const("Cheque Deposit"), Posted = const(true));
                column(ReportForNavId_1000000021; 1000000021) { } // Autogenerated by ForNav - Do not delete
                column(DocumentNo; Transactions.No)
                {
                }
                column(AccountNo; Transactions."Account No")
                {
                }
                column(AccountName; Transactions."Account Name")
                {
                }
                column(ChequeType; Transactions."Cheque Type")
                {
                }
                column(ChequeNo; Transactions."Cheque No")
                {
                }
                column(ChequeDate; Transactions."Cheque Date")
                {
                }
                column(MaturityDate; Format(Transactions."Expected Maturity Date"))
                {
                }
                column(Amount; Transactions.Amount)
                {
                }
                column(TransactionDate_Transactions; Transactions."Transaction Date")
                {
                }
                column(Payee_Transactions; Transactions.Payee)
                {
                }
                column(TypeTransactions_Transactions; Transactions."Type _Transactions")
                {
                }
                column(Description_Transactions; Transactions.Description)
                {
                }
            }
            trigger OnPreDataItem();
            begin
                ReportForNav.GetDataItem('BankAccount').NewPagePerRecord := PrintOnlyOnePerPage;

            end;

            trigger OnAfterGetRecord();
            begin
                StartBalance := 0;
                if DateFilter_BankAccount <> '' then
                    if GetRangeMin("Date Filter") <> 0D then begin
                        SetRange("Date Filter", 0D, GetRangeMin("Date Filter") - 1);
                        CalcFields("Net Change", "Net Change (LCY)");
                        StartBalance := "Net Change";
                        StartBalanceLCY := "Net Change (LCY)";
                        SetFilter("Date Filter", DateFilter_BankAccount);
                    end;
                ReportForNav.GetDataItem('BankAccount').PrintOnlyIfDetail := ExcludeBalanceOnly or (StartBalance = 0);
                BankAccBalance := StartBalance;
                BankAccBalanceLCY := StartBalanceLCY;
                if PrintOnlyOnePerPage then
                    PageGroupNo := PageGroupNo + 1;
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
                    field(PrintOnlyOnePerPage; PrintOnlyOnePerPage)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Page per Bank Account';
                        ToolTip = 'Specifies if you want to print each bank account on a separate page.';
                    }
                    field(ExcludeBalanceOnly; ExcludeBalanceOnly)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Exclude Bank Accs. That Have a Balance Only';
                        MultiLine = true;
                        ToolTip = 'Specifies if you do not want the report to include entries for bank accounts that have a balance but do not have a net change during the selected time period.';
                    }
                    field(PrintReversedEntries; PrintReversedEntries)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Include Reversed Entries';
                        ToolTip = 'Specifies if you want to include reversed entries in the report.';
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
        PageGroupNo := 1;
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
        BankAccFilter := "Bank Account".GetFilters;
        DateFilter_BankAccount := "Bank Account".GetFilter("Date Filter");
        ;
        ReportsForNavPre;
    end;

    var
        Text000: label 'Period: %1';
        PrintOnlyOnePerPage: Boolean;
        ExcludeBalanceOnly: Boolean;
        BankAccFilter: Text;
        DateFilter_BankAccount: Text;
        BankAccBalance: Decimal;
        BankAccBalanceLCY: Decimal;
        StartBalance: Decimal;
        StartBalanceLCY: Decimal;
        BankAccLedgEntryExists: Boolean;
        PrintReversedEntries: Boolean;
        PageGroupNo: Integer;
        BankAccDetailTrialBalCapLbl: label 'Bank Acc. - Detail Trial Bal.';
        CurrReportPageNoCaptionLbl: label 'Page';
        RepInclBankAcchavingBalLbl: label 'This report also includes bank accounts that only have balances.';
        BankAccLedgPostingDateCaptionLbl: label 'Posting Date';
        BankAccBalanceCaptionLbl: label 'Balance';
        OpenFormatCaptionLbl: label 'Open';
        BankAccBalanceLCYCaptionLbl: label 'Balance (LCY)';
        ContinuedCaptionLbl: label 'Continued';

    procedure InitializeRequest(NewPrintOnlyOnePerPage: Boolean; NewExcludeBalanceOnly: Boolean; NewPrintReversedEntries: Boolean)
    begin
        PrintOnlyOnePerPage := NewPrintOnlyOnePerPage;
        ExcludeBalanceOnly := NewExcludeBalanceOnly;
        PrintReversedEntries := NewPrintReversedEntries;
    end;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516149_v6_3_0_2259;
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
