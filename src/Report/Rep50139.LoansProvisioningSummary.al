#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516139_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50139 "Loans Provisioning Summary"
{
    RDLCLayout = './Layouts/LoansProvisioningSummary.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Loans; "Loans Register")
        {
            DataItemTableView = sorting("Loan  No.");
            RequestFilterFields = "Loan Product Type", "Issued Date", "Last Advice Date", "Advice Type";
            column(ReportForNavId_4645; 4645) { } // Autogenerated by ForNav - Do not delete
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(CurrReport_PAGENO; Format(ReportForNav.PageNo))
            {
            }
            column(UserId; UserId)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CompanyPic; Company.Picture)
            {
            }
            column(PROVLOSSBAL; PROVLOSSBAL)
            {
            }
            column(V100; 100)
            {
            }
            column(LOSSBAL; LOSSBAL)
            {
            }
            column(LOSSCOUNT; LOSSCOUNT)
            {
            }
            column(DOUBTBAL; DOUBTBAL)
            {
            }
            column(DOUBTCOUNT; DOUBTCOUNT)
            {
            }
            column(V50; 50)
            {
            }
            column(PROVDOUBTBAL; PROVDOUBTBAL)
            {
            }
            column(SUBBAL; SUBBAL)
            {
            }
            column(SUBCOUNT; SUBCOUNT)
            {
            }
            column(V25; 25)
            {
            }
            column(PROVSUBBAL; PROVSUBBAL)
            {
            }
            column(WATCHBAL; WATCHBAL)
            {
            }
            column(WATCHCOUNT; WATCHCOUNT)
            {
            }
            column(V5; 5)
            {
            }
            column(PROVWATCHBAL; PROVWATCHBAL)
            {
            }
            column(PERFOMBAL; PERFOMBAL)
            {
            }
            column(PERFOMCOUNT; PERFOMCOUNT)
            {
            }
            column(NoofActiveLoans_Loans; Loans."No of Active Loans")
            {
            }
            column(V0; 1)
            {
            }
            column(PROVPERFOMBAL; PROVPERFOMBAL)
            {
            }
            column(RESCHEDULE; RESCHEDULE)
            {
            }
            column(V100_Control1102756049; 100)
            {
            }
            column(RESCHEDULE_Control1102756050; RESCHEDULE)
            {
            }
            column(RESCHEDULE_Control1102756053; RESCHEDULE)
            {
            }
            column(V50_Control1102756054; 50)
            {
            }
            column(RESCHEDULE_Control1102756055; RESCHEDULE)
            {
            }
            column(RESCHEDULE_Control1102756056; RESCHEDULE)
            {
            }
            column(RESCHEDULE_Control1102756060; RESCHEDULE)
            {
            }
            column(RESCHEDULE_Control1102756061; RESCHEDULE)
            {
            }
            column(RESCHEDULE_Control1102756062; RESCHEDULE)
            {
            }
            column(V25_Control1102756063; 25)
            {
            }
            column(RESCHEDULE_Control1102756066; RESCHEDULE)
            {
            }
            column(RESCHEDULE_Control1102756067; RESCHEDULE)
            {
            }
            column(RESCHEDULE_Control1102756068; RESCHEDULE)
            {
            }
            column(V5_Control1102756069; 5)
            {
            }
            column(RESCHEDULE_Control1102756072; RESCHEDULE)
            {
            }
            column(RESCHEDULE_Control1102756073; RESCHEDULE)
            {
            }
            column(RESCHEDULE_Control1102756074; RESCHEDULE)
            {
            }
            column(V0_Control1102756075; 0)
            {
            }
            column(RESCHEDULE_Control1102756086; RESCHEDULE)
            {
            }
            column(Tcount; Tcount)
            {
            }
            column(Portfolio; Portfolio)
            {
            }
            column(Tprovision; Tprovision)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(RISK_CLASSIFICATION_OF_ASSETS_AND_PROVISIONINGCaption; RISK_CLASSIFICATION_OF_ASSETS_AND_PROVISIONINGCaptionLbl)
            {
            }
            column(FORM_4Caption; FORM_4CaptionLbl)
            {
            }
            column(SASRA_2_004Caption; SASRA_2_004CaptionLbl)
            {
            }
            column(R__46_Caption; R__46_CaptionLbl)
            {
            }
            column(No__of_A_C_sCaption; No__of_A_C_sCaptionLbl)
            {
            }
            column(Outstanding_Loan_Portfolio__Kshs__Caption; Outstanding_Loan_Portfolio__Kshs__CaptionLbl)
            {
            }
            column(Required_Provision____Caption; Required_Provision____CaptionLbl)
            {
            }
            column(Required_Provision_Amount__Kshs__Caption; Required_Provision_Amount__Kshs__CaptionLbl)
            {
            }
            column(ClassificationCaption; ClassificationCaptionLbl)
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(ACaption; ACaptionLbl)
            {
            }
            column(BCaption; BCaptionLbl)
            {
            }
            column(CCaption; CCaptionLbl)
            {
            }
            column(DCaption; DCaptionLbl)
            {
            }
            column(PORTFOLIO_AGEING_REPORTCaption; PORTFOLIO_AGEING_REPORTCaptionLbl)
            {
            }
            column(LossCaption; LossCaptionLbl)
            {
            }
            column(DoubtfulCaption; DoubtfulCaptionLbl)
            {
            }
            column(SubstandardCaption; SubstandardCaptionLbl)
            {
            }
            column(WatchCaption; WatchCaptionLbl)
            {
            }
            column(PerfomingCaption; PerfomingCaptionLbl)
            {
            }
            column(V1Caption; V1CaptionLbl)
            {
            }
            column(V2Caption; V2CaptionLbl)
            {
            }
            column(V3Caption; V3CaptionLbl)
            {
            }
            column(V4Caption; V4CaptionLbl)
            {
            }
            column(V5Caption; V5CaptionLbl)
            {
            }
            column(LossCaption_Control1102756051; LossCaption_Control1102756051Lbl)
            {
            }
            column(DoubtfulCaption_Control1102756052; DoubtfulCaption_Control1102756052Lbl)
            {
            }
            column(V4Caption_Control1102756057; V4Caption_Control1102756057Lbl)
            {
            }
            column(V5Caption_Control1102756058; V5Caption_Control1102756058Lbl)
            {
            }
            column(SubstandardCaption_Control1102756059; SubstandardCaption_Control1102756059Lbl)
            {
            }
            column(V3Caption_Control1102756064; V3Caption_Control1102756064Lbl)
            {
            }
            column(WatchCaption_Control1102756065; WatchCaption_Control1102756065Lbl)
            {
            }
            column(V2Caption_Control1102756070; V2Caption_Control1102756070Lbl)
            {
            }
            column(PerfomingCaption_Control1102756071; PerfomingCaption_Control1102756071Lbl)
            {
            }
            column(V1Caption_Control1102756076; V1Caption_Control1102756076Lbl)
            {
            }
            column(Rescheduled_Renegotiated_LoansCaption; Rescheduled_Renegotiated_LoansCaptionLbl)
            {
            }
            column(Sub_TotalCaption; Sub_TotalCaptionLbl)
            {
            }
            column(AUTHORIZATIONCaption; AUTHORIZATIONCaptionLbl)
            {
            }
            column(We_declare_that_this_return__to_the_best_of_our_knowledge_and_belief_is_correct_Caption; We_declare_that_this_return__to_the_best_of_our_knowledge_and_belief_is_correct_CaptionLbl)
            {
            }
            column(Sign__________________________________________________Date_____________________________Caption; Sign__________________________________________________Date_____________________________CaptionLbl)
            {
            }
            column(Name_of_Authorizing_OfficerCaption; Name_of_Authorizing_OfficerCaptionLbl)
            {
            }
            column(Sign__________________________________________________Date_____________________________Caption_Control1102756084; Sign__________________________________________________Date_____________________________Caption_Control1102756084Lbl)
            {
            }
            column(Name_of_Counter_Signing_OfficerCaption; Name_of_Counter_Signing_OfficerCaptionLbl)
            {
            }
            column(Loans_Loan__No_; Loans."Loan  No.")
            {
            }
            column(TBal; TBal)
            {
            }
            trigger OnPreDataItem();
            begin
                //CREATETOTALS(PERFOMBAL,WATCHBAL,SUBBAL,DOUBTBAL,LOSSBAL,PROVPERFOMBAL,PROVWATCHBAL,
                //PROVSUBBAL,PROVDOUBTBAL,PROVLOSSBAL);
            end;

            trigger OnAfterGetRecord();
            begin
                //Performing Loans
                LoansT.Reset;
                LoansT.SetRange(LoansT."Loan  No.", Loans."Loan  No.");
                LoansT.SetRange(LoansT."Loans Category-SASRA", LoansT."loans category-sasra"::Perfoming);
                if LoansT.Find('-') then begin
                    LoansT.CalcFields(LoansT."Outstanding Balance");
                    repeat
                        if LoansT."Outstanding Balance" > 0 then begin
                            PERFOMBAL := PERFOMBAL + LoansT."Outstanding Balance";
                            PERFOMCOUNT := PERFOMCOUNT + 1;
                            PROVPERFOMBAL := PERFOMBAL * 0.01;
                        end;
                    until LoansT.Next = 0;
                end;
                //Watch Loans
                LoansT.Reset;
                LoansT.SetRange(LoansT."Loan  No.", Loans."Loan  No.");
                LoansT.SetRange(LoansT."Loans Category-SASRA", LoansT."loans category-sasra"::Watch);
                if LoansT.Find('-') then begin
                    LoansT.CalcFields(LoansT."Outstanding Balance");
                    repeat
                        if LoansT."Outstanding Balance" > 0 then begin
                            WATCHBAL := WATCHBAL + LoansT."Outstanding Balance";
                            WATCHCOUNT := WATCHCOUNT + 1;
                            PROVWATCHBAL := WATCHBAL * 0.05;
                        end;
                    until LoansT.Next = 0;
                end;
                //Sub-Standard Loans
                LoansT.Reset;
                LoansT.SetRange(LoansT."Loan  No.", Loans."Loan  No.");
                LoansT.SetRange(LoansT."Loans Category-SASRA", LoansT."loans category-sasra"::Substandard);
                if LoansT.Find('-') then begin
                    LoansT.CalcFields(LoansT."Outstanding Balance");
                    repeat
                        if LoansT."Outstanding Balance" > 0 then begin
                            SUBBAL := SUBBAL + LoansT."Outstanding Balance";
                            SUBCOUNT := SUBCOUNT + 1;
                            PROVSUBBAL := SUBBAL * 0.25;
                        end;
                    until LoansT.Next = 0;
                end;
                //Doubtful Loans
                LoansT.Reset;
                LoansT.SetRange(LoansT."Loan  No.", Loans."Loan  No.");
                LoansT.SetRange(LoansT."Loans Category-SASRA", LoansT."loans category-sasra"::Doubtful);
                if LoansT.Find('-') then begin
                    LoansT.CalcFields(LoansT."Outstanding Balance");
                    repeat
                        if LoansT."Outstanding Balance" > 0 then begin
                            DOUBTBAL := DOUBTBAL + LoansT."Outstanding Balance";
                            DOUBTCOUNT := DOUBTCOUNT + 1;
                            PROVDOUBTBAL := DOUBTBAL * 0.5;
                        end;
                    until LoansT.Next = 0;
                end;
                //Loss Loans
                LoansT.Reset;
                LoansT.SetRange(LoansT."Loan  No.", Loans."Loan  No.");
                LoansT.SetRange(LoansT."Loans Category-SASRA", LoansT."loans category-sasra"::Loss);
                if LoansT.Find('-') then begin
                    LoansT.CalcFields(LoansT."Outstanding Balance");
                    repeat
                        if LoansT."Outstanding Balance" > 0 then begin
                            LOSSBAL := LOSSBAL + LoansT."Outstanding Balance";
                            LOSSCOUNT := LOSSCOUNT + 1;
                            PROVLOSSBAL := LOSSBAL * 1.0;
                        end;
                    until LoansT.Next = 0;
                end;
                Tcount := PERFOMCOUNT + WATCHCOUNT + SUBCOUNT + DOUBTCOUNT + LOSSCOUNT;
                Portfolio := PERFOMBAL + WATCHBAL + SUBBAL + DOUBTBAL + LOSSBAL;
                Tprovision := PROVPERFOMBAL + PROVWATCHBAL + PROVSUBBAL + PROVDOUBTBAL + PROVLOSSBAL;
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
        //TBal:=FnTotalOutstanding();
        ;
        ReportsForNavPre;
    end;

    var
        IntAmount: Decimal;
        RInst: Integer;
        "Net Repayment": Decimal;
        InCount: Integer;
        LoansT: Record "Loans Register";
        PERFOMBAL: Decimal;
        WATCHBAL: Decimal;
        SUBBAL: Decimal;
        DOUBTBAL: Decimal;
        LOSSBAL: Decimal;
        PERFOMCOUNT: Integer;
        WATCHCOUNT: Integer;
        SUBCOUNT: Integer;
        DOUBTCOUNT: Integer;
        LOSSCOUNT: Integer;
        PROVPERFOMBAL: Decimal;
        PROVWATCHBAL: Decimal;
        PROVSUBBAL: Decimal;
        PROVDOUBTBAL: Decimal;
        PROVLOSSBAL: Decimal;
        Tcount: Integer;
        Portfolio: Decimal;
        Tprovision: Decimal;
        RESCHEDULE: Decimal;
        CurrReport_PAGENOCaptionLbl: label 'Page';
        RISK_CLASSIFICATION_OF_ASSETS_AND_PROVISIONINGCaptionLbl: label 'RISK CLASSIFICATION OF ASSETS AND PROVISIONING';
        FORM_4CaptionLbl: label 'FORM 4';
        SASRA_2_004CaptionLbl: label 'SASRA 2/004';
        R__46_CaptionLbl: label 'R.(46)';
        No__of_A_C_sCaptionLbl: label 'No. of A/C''s';
        Outstanding_Loan_Portfolio__Kshs__CaptionLbl: label 'Outstanding Loan Portfolio (Kshs.)';
        Required_Provision____CaptionLbl: label 'Required Provision (%)';
        Required_Provision_Amount__Kshs__CaptionLbl: label 'Required Provision Amount (Kshs.)';
        ClassificationCaptionLbl: label 'Classification';
        No_CaptionLbl: label 'No.';
        ACaptionLbl: label 'A';
        BCaptionLbl: label 'B';
        CCaptionLbl: label 'C';
        DCaptionLbl: label 'D';
        PORTFOLIO_AGEING_REPORTCaptionLbl: label 'PORTFOLIO AGEING REPORT';
        LossCaptionLbl: label 'Loss';
        DoubtfulCaptionLbl: label 'Doubtful';
        SubstandardCaptionLbl: label 'Substandard';
        WatchCaptionLbl: label 'Watch';
        PerfomingCaptionLbl: label 'Perfoming';
        V1CaptionLbl: label '1';
        V2CaptionLbl: label '2';
        V3CaptionLbl: label '3';
        V4CaptionLbl: label '4';
        V5CaptionLbl: label '5';
        LossCaption_Control1102756051Lbl: label 'Loss';
        DoubtfulCaption_Control1102756052Lbl: label 'Doubtful';
        V4Caption_Control1102756057Lbl: label '4';
        V5Caption_Control1102756058Lbl: label '5';
        SubstandardCaption_Control1102756059Lbl: label 'Substandard';
        V3Caption_Control1102756064Lbl: label '3';
        WatchCaption_Control1102756065Lbl: label 'Watch';
        V2Caption_Control1102756070Lbl: label '2';
        PerfomingCaption_Control1102756071Lbl: label 'Perfoming';
        V1Caption_Control1102756076Lbl: label '1';
        Rescheduled_Renegotiated_LoansCaptionLbl: label 'Rescheduled/Renegotiated Loans';
        Sub_TotalCaptionLbl: label 'Sub-Total';
        AUTHORIZATIONCaptionLbl: label 'AUTHORIZATION';
        We_declare_that_this_return__to_the_best_of_our_knowledge_and_belief_is_correct_CaptionLbl: label 'We declare that this return, to the best of our knowledge and belief is correct.';
        Sign__________________________________________________Date_____________________________CaptionLbl: label '................................................Sign..................................................Date.............................';
        Name_of_Authorizing_OfficerCaptionLbl: label 'Name of Authorizing Officer';
        Sign__________________________________________________Date_____________________________Caption_Control1102756084Lbl: label '................................................Sign..................................................Date.............................';
        Name_of_Counter_Signing_OfficerCaptionLbl: label 'Name of Counter Signing Officer';
        Company: Record "Company Information";
        TBal: Decimal;

    local procedure FnTotalOutstanding(): Decimal
    var
        TotalBalance: Decimal;
    begin
        /*
        LoansT.RESET;
        //LoansT.SETRANGE(LoansT."Loan  No.",Loans."Loan  No.");
        //LoansT.SETRANGE(LoansT."Loans Category-SASRA",LoansT."Loans Category-SASRA"::Perfoming);
        IF LoansT.FIND('-') THEN BEGIN
        LoansT.CALCFIELDS(LoansT."Outstanding Balance");
        REPEAT
        IF LoansT."Outstanding Balance">0 THEN BEGIN
         TotalBalance:=TotalBalance+LoansT."Outstanding Balance";
        END;
       UNTIL LoansT.NEXT=0;
       END;
       EXIT(TotalBalance);
       */

    end;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516139_v6_3_0_2259;
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
