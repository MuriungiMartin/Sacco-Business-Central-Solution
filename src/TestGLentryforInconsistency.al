// codeunit 50300 CheckGLEntries
// {
//     trigger OnRun()
//     begin

//     end;

//     [EventSubscriber(ObjectType::Codeunit, codeunit::"Gen. Jnl.-Post Line", 'OnBeforeFinishPosting', '', false, false)]
//     procedure CheckGlAmountsBefore(var TempGLEntryBuf: Record "G/L Entry")
//     begin

//         with TempGLEntryBuf do begin
//             // repeat
//             Message('B amount is %1 acc %2', TempGLEntryBuf.Amount, TempGLEntryBuf."G/L Account No.");
//             Message('B credit amount is %1 acc %2', TempGLEntryBuf."Credit Amount", TempGLEntryBuf."G/L Account No.");
//             Message('B Debit amount is %1 acc %2', TempGLEntryBuf."Debit Amount", TempGLEntryBuf."G/L Account No.");
//             Message('B vat amount is %1 acc %2', TempGLEntryBuf."VAT Amount", TempGLEntryBuf."G/L Account No.");
//             Message('B  "Additional-Currency Amount" is %1 acc %2', TempGLEntryBuf."Additional-Currency Amount", TempGLEntryBuf."G/L Account No.");
//             Message('B  Add.-Currency Debit Amount is %1 acc %2', TempGLEntryBuf."Add.-Currency Debit Amount", TempGLEntryBuf."G/L Account No.");
//             Message('B  Add.-Currency credit Amount is %1 acc %2', TempGLEntryBuf."Add.-Currency Credit Amount", TempGLEntryBuf."G/L Account No.");
//             //  until TempGLEntryBuf.Next() = 0;
//         end;

//     end;

//     [EventSubscriber(ObjectType::Codeunit, codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInitGLEntry', '', false, false)]

//     procedure SeeGLEntryBeforeposting(var GLAccNo: Code[20]; Amount: Decimal)
//     begin
//         Message('gL ACC %1', GLAccNo);
//         Message('gL ACC %1', Amount);
//     end;

//     [EventSubscriber(ObjectType::Codeunit, codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitGLEntry', '', false, false)]

//     procedure SeeGLEntryAfterposting(var GLEntry: Record "G/L Entry")
//     begin
//         Message('gL ACC %1', GLEntry."G/L Account No.");
//         // Message('gL ACC %1', Amount);
//     end;

//     [EventSubscriber(ObjectType::Codeunit, codeunit::"Gen. Jnl.-Post Line", 'OnAfterFinishPosting', '', false, false)]
//     procedure CheckGlAmounts(var GlobalGLEntry: Record "G/L Entry")
//     var
//      cu13: Codeunit "Gen. Jnl.-Post Batch";
//     begin

//         with GlobalGLEntry do begin
//             // repeat
//             Message('amount is %1 acc %2', GlobalGLEntry.Amount, GlobalGLEntry."G/L Account No.");
//             Message('credit amount is %1 acc %2', GlobalGLEntry."Credit Amount", GlobalGLEntry."G/L Account No.");
//             Message('Debit amount is %1 acc %2', GlobalGLEntry."Debit Amount", GlobalGLEntry."G/L Account No.");
//             Message('vat amount is %1 acc %2', GlobalGLEntry."VAT Amount", GlobalGLEntry."G/L Account No.");
//             Message(' "Additional-Currency Amount" is %1 acc %2', GlobalGLEntry."Additional-Currency Amount", GlobalGLEntry."G/L Account No.");
//             Message(' Add.-Currency Debit Amount is %1 acc %2', GlobalGLEntry."Add.-Currency Debit Amount", GlobalGLEntry."G/L Account No.");
//             Message(' Add.-Currency credit Amount is %1 acc %2', GlobalGLEntry."Add.-Currency Credit Amount", GlobalGLEntry."G/L Account No.");
//             // until GlobalGLEntry.Next() = 0;
//         end;

//     end;



//     var
//         myInt: Integer;
// }