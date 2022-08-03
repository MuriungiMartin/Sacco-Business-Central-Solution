#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516429_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50429 "Share Capital Recovery"
{
    RDLCLayout = 'Layouts/ShareCapitalRecovery.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Members Register"; "Members Register")
        {
            //	DataItemTableView = sorting(Field1) where(Field68000=const(1));
            PrintOnlyIfDetail = false;
            //RequestFilterFields = Field1,Field55;
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
            column(S_No; RNo)
            {
            }
            column(No; "Members Register"."No.")
            {
            }
            column(Name; "Members Register".Name)
            {
            }
            column(Shares_Retained; "Members Register"."Shares Retained")
            {
            }
            column(Current_Shares; "Members Register"."Current Shares")
            {
            }
            trigger OnPreDataItem();
            begin
                /*
				Temp.GET(USERID);
				Jtemplate:=Temp."Receipt Journal Template";
				JBatch:=Temp."Receipt Journal Batch";
				IF Jtemplate = '' THEN BEGIN
				ERROR('Ensure The Receipt Journal Template is set up in csh office set up ')
				END;
				IF JBatch = '' THEN BEGIN
				ERROR('Ensure The Receipt Journal Batch is set up in csh office set up ')
				END;
				*/
                //delete journal line
                GenJournalLine.Reset;
                GenJournalLine.SetRange("Journal Template Name", 'GENERAL');
                GenJournalLine.SetRange("Journal Batch Name", 'SHARECAP');
                GenJournalLine.DeleteAll;
                //end of deletion
                if Confirm('Are you sure you want to Recover the Minimum Share Capital from Member Deposits?', true) = false then
                    exit;
                GenBatches.Reset;
                GenBatches.SetRange(GenBatches."Journal Template Name", 'GENERAL');
                GenBatches.SetRange(GenBatches.Name, 'SHARECAP');
                if GenBatches.Find('-') = false then begin
                    GenBatches.Init;
                    GenBatches."Journal Template Name" := 'GENERAL';
                    GenBatches.Name := 'SHARECAP';
                    GenBatches.Description := 'MINIMUM SHARE CAPITAL RECOVERY FROM DEPOSITS';
                    GenBatches.Validate(GenBatches."Journal Template Name");
                    GenBatches.Validate(GenBatches.Name);
                    GenBatches.Insert;
                end;

            end;

            trigger OnAfterGetRecord();
            begin
                "Members Register".CalcFields("Members Register"."Shares Retained", "Members Register"."Current Shares");
                DepositsAvailable := Abs("Members Register"."Current Shares");
                NetPayable := Abs("Members Register"."Shares Retained");
                ReqAmt := 0;
                GSetup.Get();
                //Recover Share Capital from Deposits if Less than Minimum of 5000
                if NetPayable < GSetup."Retained Shares" then begin
                    if DepositsAvailable > 0 then begin
                        ReqAmt := GSetup."Retained Shares" - NetPayable;
                        LineNo := LineNo + 10000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := 'GENERAL';
                        GenJournalLine."Journal Batch Name" := 'SHARECAP';
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Customer;
                        GenJournalLine."Account No." := "Members Register"."No.";
                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Document No." := 'MINIMUMSHARECAPRECOV';
                        GenJournalLine."Posting Date" := 20141231D;
                        GenJournalLine.Description := 'Minimum Share Capital Recovered from Deposits';
                        if DepositsAvailable > ReqAmt then begin
                            GenJournalLine.Amount := -ReqAmt
                        end else
                            GenJournalLine.Amount := -DepositsAvailable;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Shortcut Dimension 1 Code" := 'BOSA';
                        // GenJournalLine."Shortcut Dimension 2 Code":='HQ';
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        // GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;
                        LineNo := LineNo + 10000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := 'GENERAL';
                        GenJournalLine."Journal Batch Name" := 'SHARECAP';
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Customer;
                        GenJournalLine."Account No." := "Members Register"."No.";
                        GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Document No." := 'MINIMUMSHARECAPRECOV';
                        GenJournalLine."Posting Date" := 20141231D;
                        GenJournalLine.Amount := ReqAmt;
                        GenJournalLine.Description := 'Minimum Share Capital Recovered from Deposits';
                        if DepositsAvailable > ReqAmt then begin
                            GenJournalLine.Amount := ReqAmt
                        end else
                            GenJournalLine.Amount := DepositsAvailable;
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Shortcut Dimension 1 Code" := 'BOSA';
                        // GenJournalLine."Shortcut Dimension 2 Code":='HQ';
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        // GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;
                    end;
                end;
            end;

            trigger OnPostDataItem();
            begin
                /*
				//Post New
				GenJournalLine.RESET;
				GenJournalLine.SETRANGE("Journal Template Name",'GENERAL');
				GenJournalLine.SETRANGE("Journal Batch Name",'SHARECAP');
				IF GenJournalLine.FIND('-') THEN BEGIN
				CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post B",GenJournalLine);
				END;
				//Post New
				*/
                Message('Process Complete');

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
        ;
        ReportsForNavPre;
    end;

    var
        RNo: Integer;
        Company: Record "Company Information";
        GenBatches: Record "Gen. Journal Batch";
        LineNo: Integer;
        GenJournalLine: Record "Gen. Journal Line";
        "Gen. Journal Line": Codeunit "Gen. Jnl.-Post Line";
        DepositsAvailable: Decimal;
        NetPayable: Decimal;
        TotalRecovered: Decimal;
        ReqAmt: Decimal;
        Jtemplate: Code[30];
        JBatch: Code[30];
        GSetup: Record "Sacco General Set-Up";
        cust: Record "Members Register";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516429_v6_3_0_2259;
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
