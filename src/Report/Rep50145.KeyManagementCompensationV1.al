#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516145_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50145 "Key Management Compensation V1"
{
    RDLCLayout = 'Layouts/KeyManagementCompensationV1.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Payroll Employee."; "Payroll Employee.")
        {
            RequestFilterFields = Department, "Managerial Position";
            column(ReportForNavId_4645; 4645) { } // Autogenerated by ForNav - Do not delete
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(Company_Name; CompanyInfo.Name)
            {
            }
            column(Company_Address; CompanyInfo.Address)
            {
            }
            column(Company_Address_2; CompanyInfo."Address 2")
            {
            }
            column(Company_Phone_No; CompanyInfo."Phone No.")
            {
            }
            column(Company_Fax_No; CompanyInfo."Fax No.")
            {
            }
            column(Company_Picture; CompanyInfo.Picture)
            {
            }
            column(Company_Email; CompanyInfo."E-Mail")
            {
            }
            column(CurrReport_PAGENO; Format(ReportForNav.PageNo))
            {
            }
            column(UserId; UserId)
            {
            }
            column(VarEntryNo; VarEntryNo)
            {
            }
            column(VarPAYE; VarPAYE)
            {
            }
            column(VarNSSF; VarNSSF)
            {
            }
            column(VarNHIF; VarNHIF)
            {
            }
            column(VarHelb; VarHelb)
            {
            }
            column(VarHouseLevy; VarHouseLevy)
            {
            }
            column(VarPension; VarPension)
            {
            }
            column(VarLeaveAllowance; VarLeaveAllowance)
            {
            }
            column(VarActingAllowance; VarActingAllowance)
            {
            }
            column(VarHouseAllowance; VarHouseAllowance)
            {
            }
            column(VarBonuses; VarBonuses)
            {
            }
            column(VarBasicPay; VarBasicPay)
            {
            }
            column(VarGrossPay; VarGrossPay)
            {
            }
            column(EmployeeName; "No." + ': ' + Firstname + ' ' + Surname + ' ' + Lastname)
            {
            }
            column(VarNetPay; VarNetPay)
            {
            }
            trigger OnPreDataItem();
            begin
                CompanyInfo.Get;
                CompanyInfo.CalcFields(CompanyInfo.Picture);
            end;

            trigger OnAfterGetRecord();
            begin
                VarEntryNo := VarEntryNo + 1;
                VarPAYE := 0;
                VarNSSF := 0;
                VarNHIF := 0;
                VarPension := 0;
                VarHelb := 0;
                VarHouseLevy := 0;
                VarBasicPay := 0;
                VarGrossPay := 0;
                VarHouseAllowance := 0;
                VarLeaveAllowance := 0;
                VarBonuses := 0;
                VarActingAllowance := 0;
                CurrYearDateFilter := Format(VarYearStartDate) + '..' + Format(CalcDate('CY', VarYearStartDate));
                ObjPeriodTransactions.CalcFields(ObjPeriodTransactions."Sacco Member No");
                ObjPeriodTransactions.Reset;
                ObjPeriodTransactions.SetRange(ObjPeriodTransactions."Sacco Member No", "Sacco Membership No.");
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Payroll Period", CurrYearDateFilter);
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Transaction Code", '%1', 'PAYE');
                if ObjPeriodTransactions.FindSet then begin
                    ObjPeriodTransactions.CalcSums(ObjPeriodTransactions.Amount);
                    VarPAYE := ObjPeriodTransactions.Amount;
                end;
                ObjPeriodTransactions.CalcFields(ObjPeriodTransactions."Sacco Member No");
                ObjPeriodTransactions.Reset;
                ObjPeriodTransactions.SetRange(ObjPeriodTransactions."Sacco Member No", "Sacco Membership No.");
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Payroll Period", CurrYearDateFilter);
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Transaction Code", '%1', 'NSSF');
                if ObjPeriodTransactions.FindSet then begin
                    ObjPeriodTransactions.CalcSums(ObjPeriodTransactions.Amount);
                    VarNSSF := ObjPeriodTransactions.Amount;
                end;
                ObjPeriodTransactions.CalcFields(ObjPeriodTransactions."Sacco Member No");
                ObjPeriodTransactions.Reset;
                ObjPeriodTransactions.SetRange(ObjPeriodTransactions."Sacco Member No", "Sacco Membership No.");
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Payroll Period", CurrYearDateFilter);
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Transaction Code", '%1', 'NHIF');
                if ObjPeriodTransactions.FindSet then begin
                    ObjPeriodTransactions.CalcSums(ObjPeriodTransactions.Amount);
                    VarNHIF := ObjPeriodTransactions.Amount;
                end;
                ObjPeriodTransactions.CalcFields(ObjPeriodTransactions."Sacco Member No");
                ObjPeriodTransactions.Reset;
                ObjPeriodTransactions.SetRange(ObjPeriodTransactions."Sacco Member No", "Sacco Membership No.");
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Payroll Period", CurrYearDateFilter);
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Transaction Code", '%1', 'D_0009');
                if ObjPeriodTransactions.FindSet then begin
                    ObjPeriodTransactions.CalcSums(ObjPeriodTransactions.Amount);
                    VarHelb := ObjPeriodTransactions.Amount;
                end;
                ObjPeriodTransactions.CalcFields(ObjPeriodTransactions."Sacco Member No");
                ObjPeriodTransactions.Reset;
                ObjPeriodTransactions.SetRange(ObjPeriodTransactions."Sacco Member No", "Sacco Membership No.");
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Payroll Period", CurrYearDateFilter);
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Transaction Code", '%1', 'D_0017');
                if ObjPeriodTransactions.FindSet then begin
                    ObjPeriodTransactions.CalcSums(ObjPeriodTransactions.Amount);
                    VarHouseLevy := ObjPeriodTransactions.Amount;
                end;
                ObjPeriodTransactions.CalcFields(ObjPeriodTransactions."Sacco Member No");
                ObjPeriodTransactions.Reset;
                ObjPeriodTransactions.SetRange(ObjPeriodTransactions."Sacco Member No", "Sacco Membership No.");
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Payroll Period", CurrYearDateFilter);
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Transaction Code", '%1', 'D_0007');
                if ObjPeriodTransactions.FindSet then begin
                    ObjPeriodTransactions.CalcSums(ObjPeriodTransactions.Amount);
                    VarPension := ObjPeriodTransactions.Amount;
                end;
                //=====================================================================================Earnings
                ObjPeriodTransactions.CalcFields(ObjPeriodTransactions."Sacco Member No");
                ObjPeriodTransactions.Reset;
                ObjPeriodTransactions.SetRange(ObjPeriodTransactions."Sacco Member No", "Sacco Membership No.");
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Payroll Period", CurrYearDateFilter);
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Transaction Code", '%1', 'BPAY');
                if ObjPeriodTransactions.FindSet then begin
                    ObjPeriodTransactions.CalcSums(ObjPeriodTransactions.Amount);
                    VarBasicPay := ObjPeriodTransactions.Amount;
                end;
                ObjPeriodTransactions.CalcFields(ObjPeriodTransactions."Sacco Member No");
                ObjPeriodTransactions.Reset;
                ObjPeriodTransactions.SetRange(ObjPeriodTransactions."Sacco Member No", "Sacco Membership No.");
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Payroll Period", CurrYearDateFilter);
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Transaction Code", '%1', 'GPAY');
                if ObjPeriodTransactions.FindSet then begin
                    ObjPeriodTransactions.CalcSums(ObjPeriodTransactions.Amount);
                    VarGrossPay := ObjPeriodTransactions.Amount;
                end;
                ObjPeriodTransactions.CalcFields(ObjPeriodTransactions."Sacco Member No");
                ObjPeriodTransactions.Reset;
                ObjPeriodTransactions.SetRange(ObjPeriodTransactions."Sacco Member No", "Sacco Membership No.");
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Payroll Period", CurrYearDateFilter);
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Transaction Code", '%1', 'NPAY');
                if ObjPeriodTransactions.FindSet then begin
                    ObjPeriodTransactions.CalcSums(ObjPeriodTransactions.Amount);
                    VarNetPay := ObjPeriodTransactions.Amount;
                end;
                ObjPeriodTransactions.CalcFields(ObjPeriodTransactions."Sacco Member No");
                ObjPeriodTransactions.Reset;
                ObjPeriodTransactions.SetRange(ObjPeriodTransactions."Sacco Member No", "Sacco Membership No.");
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Payroll Period", CurrYearDateFilter);
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Transaction Code", '%1', 'E_0005');
                if ObjPeriodTransactions.FindSet then begin
                    ObjPeriodTransactions.CalcSums(ObjPeriodTransactions.Amount);
                    VarLeaveAllowance := ObjPeriodTransactions.Amount;
                end;
                ObjPeriodTransactions.CalcFields(ObjPeriodTransactions."Sacco Member No");
                ObjPeriodTransactions.Reset;
                ObjPeriodTransactions.SetRange(ObjPeriodTransactions."Sacco Member No", "Sacco Membership No.");
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Payroll Period", CurrYearDateFilter);
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Transaction Code", '%1', 'E_0002');
                if ObjPeriodTransactions.FindSet then begin
                    ObjPeriodTransactions.CalcSums(ObjPeriodTransactions.Amount);
                    VarActingAllowance := ObjPeriodTransactions.Amount;
                end;
                ObjPeriodTransactions.CalcFields(ObjPeriodTransactions."Sacco Member No");
                ObjPeriodTransactions.Reset;
                ObjPeriodTransactions.SetRange(ObjPeriodTransactions."Sacco Member No", "Sacco Membership No.");
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Payroll Period", CurrYearDateFilter);
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Transaction Code", '%1', 'E_0007');
                if ObjPeriodTransactions.FindSet then begin
                    ObjPeriodTransactions.CalcSums(ObjPeriodTransactions.Amount);
                    VarBonuses := ObjPeriodTransactions.Amount;
                end;
                ObjPeriodTransactions.CalcFields(ObjPeriodTransactions."Sacco Member No");
                ObjPeriodTransactions.Reset;
                ObjPeriodTransactions.SetRange(ObjPeriodTransactions."Sacco Member No", "Sacco Membership No.");
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Payroll Period", CurrYearDateFilter);
                ObjPeriodTransactions.SetFilter(ObjPeriodTransactions."Transaction Code", '%1', 'E_0001');
                if ObjPeriodTransactions.FindSet then begin
                    ObjPeriodTransactions.CalcSums(ObjPeriodTransactions.Amount);
                    VarHouseAllowance := ObjPeriodTransactions.Amount;
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
                group(Control2)
                {
                    field("Year Start Date"; VarYearStartDate)
                    {
                        ApplicationArea = Basic;
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
        AsAt: Date;
        Company: Record "Company Information";
        SFactory: Codeunit "SURESTEP Factory";
        ObjGensetup: Record "Sacco General Set-Up";
        CurrReport_PAGENOCaptionLbl: label 'Page';
        RISK_CLASSIFICATION_OF_ASSETS_AND_PROVISIONINGCaptionLbl: label 'RISK CLASSIFICATION OF ASSETS AND PROVISIONING';
        FORM_4CaptionLbl: label 'FORM 4';
        SASRA_2_004CaptionLbl: label 'SASRA 2/004';
        R__46_CaptionLbl: label 'R.(46)';
        ObjMembers: Record "Members Register";
        VarEntryNo: Integer;
        ObjPeriodTransactions: Record "prPeriod Transactions.";
        VarPAYE: Decimal;
        VarNSSF: Decimal;
        VarNHIF: Decimal;
        VarHelb: Decimal;
        VarHouseLevy: Decimal;
        VarPension: Decimal;
        VarLeaveAllowance: Decimal;
        VarActingAllowance: Decimal;
        VarHouseAllowance: Decimal;
        VarBonuses: Decimal;
        VarBasicPay: Decimal;
        VarGrossPay: Decimal;
        CompanyInfo: Record "Company Information";
        CurrYearDateFilter: Text;
        VarBeginMonth: Integer;
        VarBeginDate: Integer;
        VarCurrYear: Integer;
        VarYearStartDate: Date;
        VarNetPay: Decimal;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516145_v6_3_0_2259;
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
