#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516349_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50349 "P.10 A 2.."
{
    RDLCLayout = './Layouts/P.10A2...rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("prSalary Card"; "prSalary Card")
        {
            DataItemTableView = sorting("Employee Code") order(ascending);
            column(ReportForNavId_6207; 6207) { } // Autogenerated by ForNav - Do not delete
            column(UPPERCASE_COMPANYNAME_; UpperCase(COMPANYNAME))
            {
            }
            column(CompanySetup__Company_P_I_N_; CompanySetup."Company P.I.N")
            {
            }
            column(YR; YR)
            {
            }
            column(Employee_Payroll___First_Name_______Employee_Payroll___Middle_Name_______Employee_Payroll___Last_Name_; "Employee Payroll"."First Name" + ' ' + "Employee Payroll"."Middle Name" + ' ' + "Employee Payroll"."Last Name")
            {
            }
            column(GrossPay; GrossPay)
            {
            }
            column(ABS_MyPAYE_; Abs(MyPAYE))
            {
            }
            column(Employee_Payroll___PIN_Number_; "Employee Payroll"."PIN No.")
            {
            }
            column(ABS_MyPAYE__Control1102756065; Abs(MyPAYE))
            {
            }
            column(GrossPay_Control1102756086; GrossPay)
            {
            }
            column(ABS_MyPAYE__Control1102756092; Abs(MyPAYE))
            {
            }
            column(GrossPay_Control1102756113; GrossPay)
            {
            }
            column(PAYE_DEDUCTED_KSHS_Caption; PAYE_DEDUCTED_KSHS_CaptionLbl)
            {
            }
            column(TOTAL_EMOLUMENTS_KSHS_Caption; TOTAL_EMOLUMENTS_KSHS_CaptionLbl)
            {
            }
            column(EMPLOYEE_S_NAMECaption; EMPLOYEE_S_NAMECaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102756009; EmptyStringCaption_Control1102756009Lbl)
            {
            }
            column(EMPLOYER_S_NAMECaption; EMPLOYER_S_NAMECaptionLbl)
            {
            }
            column(EMPLOYER_S_PINCaption; EMPLOYER_S_PINCaptionLbl)
            {
            }
            column(P_A_Y_E_SUPPORTING_LIST_FOR_END_OF_YEAR_CERTIFICATE__YEARCaption; P_A_Y_E_SUPPORTING_LIST_FOR_END_OF_YEAR_CERTIFICATE__YEARCaptionLbl)
            {
            }
            column(EMPLOYEE_S_PINCaption; EMPLOYEE_S_PINCaptionLbl)
            {
            }
            column(P_10ACaption; P_10ACaptionLbl)
            {
            }
            column(APPENDIX_5ACaption; APPENDIX_5ACaptionLbl)
            {
            }
            column(DOMESTIC_TAXES_DEPARTMENTCaption; DOMESTIC_TAXES_DEPARTMENTCaptionLbl)
            {
            }
            column(ATTACH_TWO_COPIES_OF_THIS_LIST_TO_END_OF_YEAR_CERTIFICATE__P10_Caption; ATTACH_TWO_COPIES_OF_THIS_LIST_TO_END_OF_YEAR_CERTIFICATE__P10_CaptionLbl)
            {
            }
            column(DELETE_AS_APPROPRIATECaption; DELETE_AS_APPROPRIATECaptionLbl)
            {
            }
            column(NOTE_TO_EMPLOYER_Caption; NOTE_TO_EMPLOYER_CaptionLbl)
            {
            }
            column(TOTAL_TAX_DEDUCTED__TOTAL_C_F_TO_NEXT_LISTCaption; TOTAL_TAX_DEDUCTED__TOTAL_C_F_TO_NEXT_LISTCaptionLbl)
            {
            }
            column(TAX_ON_LUMP_SUM__AUDIT__INTEREST___PENALTYCaption; TAX_ON_LUMP_SUM__AUDIT__INTEREST___PENALTYCaptionLbl)
            {
            }
            column(TOTAL_WCPSCaption; TOTAL_WCPSCaptionLbl)
            {
            }
            column(TOTAL_PAYE_TAXCaption; TOTAL_PAYE_TAXCaptionLbl)
            {
            }
            column(TOTAL_EMOLUMENTSCaption; TOTAL_EMOLUMENTSCaptionLbl)
            {
            }
            column(ATTACH_TWO_COPIES_OF_THIS_LIST_TO_END_OF_YEAR_CERTIFICATE__P10_Caption_Control1102756087; ATTACH_TWO_COPIES_OF_THIS_LIST_TO_END_OF_YEAR_CERTIFICATE__P10_Caption_Control1102756087Lbl)
            {
            }
            column(DELETE_AS_APPROPRIATECaption_Control1102756088; DELETE_AS_APPROPRIATECaption_Control1102756088Lbl)
            {
            }
            column(TOTAL_TAX_DEDUCTED__TOTAL_C_F_TO_NEXT_LISTCaption_Control1102756091; TOTAL_TAX_DEDUCTED__TOTAL_C_F_TO_NEXT_LISTCaption_Control1102756091Lbl)
            {
            }
            column(NOTE_TO_EMPLOYER_Caption_Control1102756095; NOTE_TO_EMPLOYER_Caption_Control1102756095Lbl)
            {
            }
            column(TAX_ON_LUMP_SUM__AUDIT__INTEREST___PENALTYCaption_Control1102756096; TAX_ON_LUMP_SUM__AUDIT__INTEREST___PENALTYCaption_Control1102756096Lbl)
            {
            }
            column(TOTAL_WCPSCaption_Control1102756103; TOTAL_WCPSCaption_Control1102756103Lbl)
            {
            }
            column(TOTAL_PAYE_TAXCaption_Control1102756107; TOTAL_PAYE_TAXCaption_Control1102756107Lbl)
            {
            }
            column(TOTAL_EMOLUMENTSCaption_Control1102756112; TOTAL_EMOLUMENTSCaption_Control1102756112Lbl)
            {
            }
            column(prSalary_Card_Employee_Code; "prSalary Card"."Employee Code")
            {
            }
            trigger OnPreDataItem();
            begin
                SetRange("Period Filter", StringDate, EndDate);
                YR := Date2dmy(StringDate, 3);
            end;

            trigger OnAfterGetRecord();
            begin
                if "Employee Payroll".Get("Employee Code") then begin
                end;
                MyPAYE := 0;
                GrossPay := 0;
                CalcFields("Cumm PAYE");
                CalcFields("Cumm Allowances", "prSalary Card"."Cumm BasicPay");
                CalcFields("Cumm GrossPay");
                PAYE := Abs("Cumm PAYE");
                TotalCumm := TotalCumm + Abs("Cumm PAYE");
                MyPAYE := "Cumm PAYE";
                if Abs("Cumm PAYE") > 0 then begin
                    GrossPay := "Cumm GrossPay";
                    Index := Index + 1;
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
        if UserSetup.Get(UserId) then begin
            if UserSetup."View Payroll" = false then Error('You dont have permissions for payroll, Contact your system administrator! ')
        end;
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
        StringDate: Date;
        EndDate: Date;
        PAYE: Decimal;
        TotPAYE: Decimal;
        CompanySetup: Record "Control-Information";
        YR: Integer;
        TotalCumm: Decimal;
        Index: Integer;
        TotPayeTemp: Decimal;
        EmpLedgerentry: Record "prPeriod Transactions";
        GrossPay: Decimal;
        EmpCalc: Record "prSalary Card";
        MyPAYE: Decimal;
        MyPAYETot: Decimal;
        MyPGROSSTot: Decimal;
        "Employee Payroll": Record "HR Employees";
        PAYE_DEDUCTED_KSHS_CaptionLbl: label 'PAYE DEDUCTED KSHS.';
        TOTAL_EMOLUMENTS_KSHS_CaptionLbl: label 'TOTAL EMOLUMENTS KSHS.';
        EMPLOYEE_S_NAMECaptionLbl: label 'EMPLOYEE''S NAME';
        EmptyStringCaptionLbl: label '...........................................................';
        EmptyStringCaption_Control1102756009Lbl: label '...........................................................';
        EMPLOYER_S_NAMECaptionLbl: label 'EMPLOYER''S NAME';
        EMPLOYER_S_PINCaptionLbl: label 'EMPLOYER''S PIN';
        P_A_Y_E_SUPPORTING_LIST_FOR_END_OF_YEAR_CERTIFICATE__YEARCaptionLbl: label 'P.A.Y.E SUPPORTING LIST FOR END OF YEAR CERTIFICATE: YEAR';
        EMPLOYEE_S_PINCaptionLbl: label 'EMPLOYEE''S PIN';
        P_10ACaptionLbl: label 'P.10A';
        APPENDIX_5ACaptionLbl: label 'APPENDIX 5A';
        DOMESTIC_TAXES_DEPARTMENTCaptionLbl: label 'DOMESTIC TAXES DEPARTMENT';
        ATTACH_TWO_COPIES_OF_THIS_LIST_TO_END_OF_YEAR_CERTIFICATE__P10_CaptionLbl: label 'ATTACH TWO COPIES OF THIS LIST TO END OF YEAR CERTIFICATE (P10)';
        DELETE_AS_APPROPRIATECaptionLbl: label '*DELETE AS APPROPRIATE';
        NOTE_TO_EMPLOYER_CaptionLbl: label 'NOTE TO EMPLOYER:';
        TOTAL_TAX_DEDUCTED__TOTAL_C_F_TO_NEXT_LISTCaptionLbl: label '*TOTAL TAX DEDUCTED/ TOTAL C/F TO NEXT LIST';
        TAX_ON_LUMP_SUM__AUDIT__INTEREST___PENALTYCaptionLbl: label '*TAX ON LUMP SUM/ AUDIT/ INTEREST / PENALTY';
        TOTAL_WCPSCaptionLbl: label 'TOTAL WCPS';
        TOTAL_PAYE_TAXCaptionLbl: label 'TOTAL PAYE TAX';
        TOTAL_EMOLUMENTSCaptionLbl: label 'TOTAL EMOLUMENTS';
        ATTACH_TWO_COPIES_OF_THIS_LIST_TO_END_OF_YEAR_CERTIFICATE__P10_Caption_Control1102756087Lbl: label 'ATTACH TWO COPIES OF THIS LIST TO END OF YEAR CERTIFICATE (P10)';
        DELETE_AS_APPROPRIATECaption_Control1102756088Lbl: label '*DELETE AS APPROPRIATE';
        TOTAL_TAX_DEDUCTED__TOTAL_C_F_TO_NEXT_LISTCaption_Control1102756091Lbl: label '*TOTAL TAX DEDUCTED/ TOTAL C/F TO NEXT LIST';
        NOTE_TO_EMPLOYER_Caption_Control1102756095Lbl: label 'NOTE TO EMPLOYER:';
        TAX_ON_LUMP_SUM__AUDIT__INTEREST___PENALTYCaption_Control1102756096Lbl: label '*TAX ON LUMP SUM/ AUDIT/ INTEREST / PENALTY';
        TOTAL_WCPSCaption_Control1102756103Lbl: label 'TOTAL WCPS';
        TOTAL_PAYE_TAXCaption_Control1102756107Lbl: label 'TOTAL PAYE TAX';
        TOTAL_EMOLUMENTSCaption_Control1102756112Lbl: label 'TOTAL EMOLUMENTS';
        UserSetup: Record "User Setup";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516349_v6_3_0_2259;
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
