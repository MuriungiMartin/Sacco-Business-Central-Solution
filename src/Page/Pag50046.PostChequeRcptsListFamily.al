#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Page 50046 "Post Cheque Rcpts List-Family"
{
    CardPageID = "Posted Cheque Rcpt H-Family";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Cheque Receipts-Family";
    SourceTableView = where(Closed = filter(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field("Transaction Date"; "Transaction Date")
                {
                    ApplicationArea = Basic;
                }
                field("Refference Document"; "Refference Document")
                {
                    ApplicationArea = Basic;
                }
                field("Transaction Time"; "Transaction Time")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; "Posted By")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Unpaid By"; "Unpaid By")
                {
                    ApplicationArea = Basic;
                }
                field(Unpaid; Unpaid)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Inward Cheques Report")
            {
                ApplicationArea = Basic;
                Image = Form;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    ObjInwardHeader.Reset;
                    ObjInwardHeader.SetRange(ObjInwardHeader."No.", "No.");
                    if ObjInwardHeader.FindSet then
                        Report.run(50877, true, true, ObjInwardHeader)
                end;
            }
        }
    }

    var
        ObjInwardHeader: Record "Cheque Receipts-Family";
}

