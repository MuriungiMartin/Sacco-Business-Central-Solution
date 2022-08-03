// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50101 customerListExtension extends "Customer List"
{
    layout
    {

    }
    trigger OnOpenPage()
    begin
        Page.Run(Page::"Members List");
    end;

}