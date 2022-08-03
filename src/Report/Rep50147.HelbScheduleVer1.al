#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516147_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50147 "Helb Schedule Ver1"
{
    RDLCLayout = 'Layouts/HelbScheduleVer1.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Payroll Employee."; "Payroll Employee.")
        {
            column(ReportForNavId_6207; 6207) { } // Autogenerated by ForNav - Do not delete
            column(UserId; UserId)
            {
            }
            column(Today; Today)
            {
            }
            column(PeriodName; PeriodName)
            {
            }
            column(CurrReport_PAGENO; Format(ReportForNav.PageNo))
            {
            }
            column(companyinfo_Picture; companyinfo.Picture)
            {
            }
            column(prSalary_Card__prSalary_Card___Employee_Code_; "Payroll Employee."."No.")
            {
            }
            column(EmployeeName; EmployeeName)
            {
            }
            column(PinNumber; PinNumber)
            {
            }
            column(PayeAmount; PayeAmount)
            {
            }
            column(VarHelb; VarHelb)
            {
            }
            column(TaxablePay; TaxablePay)
            {
            }
            column(TotTaxablePay; TotTaxablePay)
            {
            }
            column(CompName; CompName)
            {
            }
            column(IDS_NUMBER; "Payroll Employee."."National ID No")
            {
            }
            column(Addr1; Addr1)
            {
            }
            column(Addr2; Addr2)
            {
            }
            column(Email; Email)
            {
            }
            column(TotPayeAmount; TotPayeAmount)
            {
            }
            column(User_Name_Caption; User_Name_CaptionLbl)
            {
            }
            column(Print_Date_Caption; Print_Date_CaptionLbl)
            {
            }
            column(P_A_Y_E_ScheduleCaption; P_A_Y_E_ScheduleCaptionLbl)
            {
            }
            column(Period_Caption; Period_CaptionLbl)
            {
            }
            column(Page_No_Caption; Page_No_CaptionLbl)
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(Employee_NameCaption; Employee_NameCaptionLbl)
            {
            }
            column(PIN_Number_Caption; PIN_Number_CaptionLbl)
            {
            }
            column(Paye_Amount_Caption; Paye_Amount_CaptionLbl)
            {
            }
            column(Taxable_Pay_Caption; Taxable_Pay_CaptionLbl)
            {
            }
            column(Prepared_by_______________________________________Date_________________Caption; Prepared_by_______________________________________Date_________________CaptionLbl)
            {
            }
            column(Checked_by________________________________________Date_________________Caption; Checked_by________________________________________Date_________________CaptionLbl)
            {
            }
            column(Totals_Caption; Totals_CaptionLbl)
            {
            }
            column(Authorized_by____________________________________Date_________________Caption; Authorized_by____________________________________Date_________________CaptionLbl)
            {
            }
            column(Approved_by______________________________________Date_________________Caption; Approved_by______________________________________Date_________________CaptionLbl)
            {
            }
            trigger OnPreDataItem();
            begin
                if companyinfo.Get() then
                    companyinfo.CalcFields(companyinfo.Picture);
                CompName := companyinfo.Name;
                Addr1 := companyinfo.Address;
                Addr2 := companyinfo.City;
                Email := companyinfo."E-Mail";
                TotPayeAmount := 0;
                TotTaxablePay := 0;
            end;

            trigger OnAfterGetRecord();
            begin
                PayeAmount := 0;
                VarHelb := 0;
                objEmp.Reset;
                objEmp.SetRange(objEmp."No.", "No.");
                if objEmp.Find('-') then
                    EmployeeName := objEmp.Firstname + ' ' + objEmp.Lastname + ' ' + objEmp.Surname;
                PinNumber := objEmp."PIN No";
                PeriodTrans.Reset;
                PeriodTrans.SetRange(PeriodTrans."Employee Code", "No.");
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                PeriodTrans.SetFilter(PeriodTrans."Transaction Code", 'D_0009');
                if PeriodTrans.Find('-') then begin
                    VarHelb := PeriodTrans.Amount;
                end;
                if VarHelb <= 0 then
                    CurrReport.Skip;
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
                field(PeriodFilter; PeriodFilter)
                {
                    ApplicationArea = Basic;
                    Caption = 'Period:';
                    TableRelation = "Payroll Calender.";
                    Visible = true;
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
        objPeriod.Reset;
        objPeriod.SetRange(objPeriod.Closed, false);
        if objPeriod.Find('-') then;
        PeriodFilter := objPeriod."Date Opened";
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
        if UserSetup.Get(UserId) then begin
            if UserSetup."View Payroll" = false then Error('You dont have permissions for payroll, Contact your system administrator! ')
        end;
        //PeriodFilter:="prSalary Card".GETFILTER("Period Filter");
        if PeriodFilter = 0D then Error('You must specify the period filter');
        SelectedPeriod := PeriodFilter;
        objPeriod.Reset;
        if objPeriod.Get(SelectedPeriod) then PeriodName := objPeriod."Period Name";
        if companyinfo.Get() then
            companyinfo.CalcFields(companyinfo.Picture);
        ;
        ReportsForNavPre;
    end;

    var
        UserSetup: Record "User Setup";
        PeriodTrans: Record "prPeriod Transactions.";
        PayeAmount: Decimal;
        TotPayeAmount: Decimal;
        TaxablePay: Decimal;
        TotTaxablePay: Decimal;
        EmployeeName: Text[150];
        PinNumber: Text[30];
        objPeriod: Record "prPayroll Periods";
        objEmp: Record "Payroll Employee.";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodFilter: Date;
        companyinfo: Record "Company Information";
        User_Name_CaptionLbl: label 'User Name:';
        Print_Date_CaptionLbl: label 'Print Date:';
        P_A_Y_E_ScheduleCaptionLbl: label 'P.A.Y.E Schedule';
        Period_CaptionLbl: label 'Period:';
        Page_No_CaptionLbl: label 'Page No:';
        No_CaptionLbl: label 'No:';
        Employee_NameCaptionLbl: label 'Employee Name';
        PIN_Number_CaptionLbl: label 'PIN Number:';
        Paye_Amount_CaptionLbl: label 'Paye Amount:';
        Taxable_Pay_CaptionLbl: label 'Taxable Pay:';
        Prepared_by_______________________________________Date_________________CaptionLbl: label 'Prepared byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..				 DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Checked_by________________________________________Date_________________CaptionLbl: label 'Checked byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..				   DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Totals_CaptionLbl: label 'Totals:';
        Authorized_by____________________________________Date_________________CaptionLbl: label 'Authorized byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..			  DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Approved_by______________________________________Date_________________CaptionLbl: label 'Approved byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..				DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        CompName: Text[50];
        Addr1: Text[50];
        Addr2: Text[50];
        Email: Text[50];
        VarHelb: Decimal;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516147_v6_3_0_2259;
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
