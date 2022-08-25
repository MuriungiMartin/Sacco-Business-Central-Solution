pageextension 50182 smtpExt extends "SMTP Mail Setup"
{
    layout
    {
        addafter("User ID")
        {
            field("Email Sender Address"; "Email Sender Address")
            {

            }
            field("Email Sender Name"; "Email Sender Name") { }
            field("Path to Save Report"; "Path to Save Report")
            { }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}