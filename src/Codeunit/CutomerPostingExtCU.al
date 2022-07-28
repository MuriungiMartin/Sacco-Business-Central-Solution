codeunit 50163 PostCustomerExtension
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::codeunit, 12, 'OnAfterInsertDtldCustLedgEntry', '', false, false)]
    procedure InsertCustomfieldstodetailedcustledgerentry(GenJournalLine: Record "Gen. Journal Line"; var DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry")
    begin

        DtldCustLedgEntry."Transaction Type" := GenJournalLine."Transaction Type";
        DtldCustLedgEntry."Loan No" := GenJournalLine."Loan No";
        DtldCustLedgEntry."Loan Type" := GenJournalLine."Loan Product Type";
        DtldCustLedgEntry."Recoverd Loan" := GenJournalLine."Recoverd Loan";
        DtldCustLedgEntry."Recovery Transaction Type" := GenJournalLine."Recovery Transaction Type";
        DtldCustLedgEntry."Transaction Date" := WorkDate();
        DtldCustLedgEntry."Application Source" := GenJournalLine."Application Source";
        DtldCustLedgEntry."Created On" := CurrentDateTime;


    end;

    [EventSubscriber(ObjectType::Codeunit, 12, 'OnBeforePostGenJnlLine', '', false, false)]
    procedure ModifyReceivablesAccount(var GenJournalLine: Record "Gen. Journal Line")
    var
        Cust: Record Customer;
        TransactionTypestable: record "Transaction Types Table";
    begin
        if cust.Get(GenJournalLine."Account No.") then begin
            if cust."Account Category" = cust."Account Category"::Individual then begin
                Message('Name %1 PGroup %2', cust.Name, Cust."Customer Posting Group");

                TransactionTypestable.reset;
                TransactionTypestable.SetRange(TransactionTypestable."Transaction Type", GenJournalLine."Transaction Type");
                if TransactionTypestable.Find('-') then begin
                    GenJournalLine."Posting Group" := TransactionTypestable."Posting Group Code";
                    GenJournalLine.Modify();
                    Message('New Posting group %1', GenJournalLine."Posting Group");
                end;
            end;
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitCustLedgEntry', '', false, false)]
    procedure InsertCustomTransactionFields(GenJournalLine: Record "Gen. Journal Line"; var CustLedgerEntry: Record "Cust. Ledger Entry")
    var
        cust: Record Customer;
    begin

        CustLedgerEntry."Transaction Type" := GenJournalLine."Transaction Type";
        CustLedgerEntry."Loan No" := GenJournalLine."Loan No";
        CustLedgerEntry."Loan Type" := GenJournalLine."Loan Product Type";
        CustLedgerEntry."Recoverd Loan" := GenJournalLine."Recoverd Loan";
        CustLedgerEntry."Recovery Transaction Type" := GenJournalLine."Recovery Transaction Type";
        CustLedgerEntry."Transaction Date" := WorkDate();
        CustLedgerEntry."Application Source" := GenJournalLine."Application Source";
        CustLedgerEntry."Created On" := CurrentDateTime;
        CustLedgerEntry."Transaction Amount" := Abs(GenJournalLine.Amount);

    end;


    var
        CustPostingGroups: Record "Customer Posting Group";
        Found: Boolean;

}