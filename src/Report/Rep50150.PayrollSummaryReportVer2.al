#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{
    assembly("ForNav.Reports.6.3.0.2259")
    {
        type(ForNav.Report_6_3_0_2259; ForNavReport51516150_v6_3_0_2259) { }
    }
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50150 "Payroll Summary Report Ver2"
{
    RDLCLayout = 'Layouts/PayrollSummaryReportVer2.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Payroll Employee."; "Payroll Employee.")
        {
            PrintOnlyIfDetail = false;
            column(ReportForNavId_4645; 4645) { } // Autogenerated by ForNav - Do not delete
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CompanyInfoName; CompanyInfo.Name)
            {
            }
            column(CompanyInfoAddress; CompanyInfo.Address)
            {
            }
            column(CompanyInfoAddress_2; CompanyInfo."Address 2")
            {
            }
            column(CompanyInfoPhone_No; CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfoFax_No; CompanyInfo."Fax No.")
            {
            }
            column(CompanyInfoPicture; CompanyInfo.Picture)
            {
            }
            column(CompanyInfoEmail; CompanyInfo."E-Mail")
            {
            }
            column(CurrReport_PAGENO; Format(ReportForNav.PageNo))
            {
            }
            column(UserId; UserId)
            {
            }
            column(VarCount; VarCount)
            {
            }
            column(DocumentNo_PayrollEmployee; "Payroll Employee."."Document No")
            {
            }
            column(No_PayrollEmployee; "Payroll Employee."."No.")
            {
            }
            column(EmployeeName; "No." + ': ' + Firstname + ' ' + Surname + ' ' + Lastname)
            {
            }
            column(VarPayrollPeriod; Format(CalcDate('CM', VarPayrollPeriod), 0, '<Day,2> <Month Text,3> <Year4>'))
            {
            }
            column(BasicPay; BasicPay)
            {
            }
            column(BasicPayTotal; BasicPayTotal)
            {
            }
            column(GrossPay; GrossPay)
            {
            }
            column(GrosspayTotal; GrosspayTotal)
            {
            }
            column(NetPay; NetPay)
            {
            }
            column(NetPayTotal; NetPayTotal)
            {
            }
            column(PAYEamount; PAYEamount)
            {
            }
            column(PAYEamountTotal; PAYEamountTotal)
            {
            }
            column(NSSFAmount; NSSFAmount)
            {
            }
            column(NSSFAmountTotal; NSSFAmountTotal)
            {
            }
            column(NHIFAmount; NHIFAmount)
            {
            }
            column(NHIFAmountTotal; NHIFAmountTotal)
            {
            }
            column(VarLeaveAllowance; VarLeaveAllowance)
            {
            }
            column(TotalVarLeaveAllowance; TotalVarLeaveAllowance)
            {
            }
            column(VarActingAllowance; VarActingAllowance)
            {
            }
            column(TotalVarActingAllowance; TotalVarActingAllowance)
            {
            }
            column(HouseAllowance; HouseAllowance)
            {
            }
            column(TotalHouseAllowance; TotalHouseAllowance)
            {
            }
            column(Bonuses; Bonuses)
            {
            }
            column(TotalBonuses; TotalBonuses)
            {
            }
            column(OtherAllowances; OtherAllowances)
            {
            }
            column(TotalOtherAllowances; TotalOtherAllowances)
            {
            }
            column(Pension; Pension)
            {
            }
            column(TotalPension; TotalPension)
            {
            }
            column(NonTaxablePay; NonTaxablePay)
            {
            }
            column(TotalNonTaxablePay; TotalNonTaxablePay)
            {
            }
            column(TaxablePay; TaxablePay)
            {
            }
            column(TotalTaxablePay; TotalTaxablePay)
            {
            }
            column(HelbLoan; HelbLoan)
            {
            }
            column(TotalHelbLoan; TotalHelbLoan)
            {
            }
            column(VoluntaryDeduction; VoluntaryDeduction)
            {
            }
            column(TotalVoluntaryDeduction; TotalVoluntaryDeduction)
            {
            }
            column(Advance; Advance)
            {
            }
            column(TotalAdvance; TotalAdvance)
            {
            }
            column(LoansDeductions; LoansDeductions)
            {
            }
            column(TotalDeductionsTotal; TotalDeductionsTotal)
            {
            }
            column(Deposits; Deposits)
            {
            }
            column(TotalDeposits; TotalDeposits)
            {
            }
            column(TotalDeductions; TotalDeductions)
            {
            }
            column(TotalLoansDeductions; TotalLoansDeductions)
            {
            }
            column(VarHouseLevy; VarHouseLevy)
            {
            }
            column(VarSalaryArrears; VarSalaryArrears)
            {
            }
            column(VarEOY; VarEOY)
            {
            }
            column(VarMileageAllowance; VarMileageAllowance)
            {
            }
            column(VarOtherTaxableBenefits; VarOtherTaxableBenefits)
            {
            }
            column(VarOtherNonTaxableBenefits; VarOtherNonTaxableBenefits)
            {
            }
            column(VoluntaryPension; VoluntaryPension)
            {
            }
            column(VarStatutoryRuleText; VarStatutoryRuleText)
            {
            }
            column(VarHRRuleText; VarHRRuleText)
            {
            }
            column(VarHouseAllowance; VarHouseAllowance)
            {
            }
            trigger OnAfterGetRecord();
            begin
                VarAmountinArrears := 0;
                VarCount := VarCount + 1;
                NetPay := 0;
                PAYEamount := 0;
                NSSFAmount := 0;
                NHIFAmount := 0;
                BasicPay := 0;
                GrossPay := 0;
                VarLeaveAllowance := 0;
                VarActingAllowance := 0;
                VarHouseAllowance := 0;
                Pension := 0;
                HelbLoan := 0;
                TaxablePay := 0;
                NonTaxablePay := 0;
                PAYEamount := 0;
                Deposits := 0;
                TotalDeductions := 0;
                LoansDeductions := 0;
                VarSalaryArrears := 0;
                VarEOY := 0;
                VarHouseLevy := 0;
                VarOtherNonTaxableBenefits := 0;
                VarOtherTaxableBenefits := 0;
                Bonuses := 0;
                VarMileageAllowance := 0;
                VoluntaryPension := 0;
                Advance := 0;
                VarStatutoryRule := 0;
                ObjEmployeePeriodTransactions.Reset;
                ObjEmployeePeriodTransactions.SetRange(ObjEmployeePeriodTransactions."Employee Code", "No.");
                ObjEmployeePeriodTransactions.SetFilter(ObjEmployeePeriodTransactions."Payroll Period", '%1', VarPayrollPeriod);
                ObjEmployeePeriodTransactions.SetFilter(ObjEmployeePeriodTransactions."coop parameters", '%1|%2', ObjEmployeePeriodTransactions."coop parameters"::loan,
                ObjEmployeePeriodTransactions."coop parameters"::"loan Interest");
                if ObjEmployeePeriodTransactions.Find('-') then begin
                    ObjEmployeePeriodTransactions.CalcSums(ObjEmployeePeriodTransactions.Amount);
                    LoansDeductions := ObjEmployeePeriodTransactions.Amount;
                end;
                ObjEmployeePeriodTransactions.Reset;
                ObjEmployeePeriodTransactions.SetRange(ObjEmployeePeriodTransactions."Employee Code", "No.");
                ObjEmployeePeriodTransactions.SetFilter(ObjEmployeePeriodTransactions."Payroll Period", '%1', VarPayrollPeriod);
                if ObjEmployeePeriodTransactions.Find('-') then begin
                    repeat
                    begin
                        if ObjEmployeePeriodTransactions."Transaction Code" = 'NPAY' then begin
                            NetPay := ObjEmployeePeriodTransactions.Amount;
                            NetPayTotal := (NetPayTotal + (ObjEmployeePeriodTransactions.Amount));
                        end else
                            if ObjEmployeePeriodTransactions."Transaction Code" = 'PAYE' then begin
                                PAYEamount := ObjEmployeePeriodTransactions.Amount;
                                PAYEamountTotal := (PAYEamountTotal + (ObjEmployeePeriodTransactions.Amount));
                            end else
                                if ObjEmployeePeriodTransactions."Transaction Code" = 'NSSF' then begin
                                    NSSFAmount := ObjEmployeePeriodTransactions.Amount;
                                    NSSFAmountTotal := (NSSFAmountTotal + (ObjEmployeePeriodTransactions.Amount));
                                end else
                                    if ObjEmployeePeriodTransactions."Transaction Code" = 'NHIF' then begin
                                        NHIFAmount := ObjEmployeePeriodTransactions.Amount;
                                        NHIFAmountTotal := (NHIFAmountTotal + (ObjEmployeePeriodTransactions.Amount));
                                    end else
                                        if ObjEmployeePeriodTransactions."Transaction Code" = 'BPAY' then begin
                                            BasicPay := ObjEmployeePeriodTransactions.Amount;
                                            BasicPayTotal := (BasicPayTotal + (ObjEmployeePeriodTransactions.Amount));
                                        end else
                                            if ObjEmployeePeriodTransactions."Transaction Code" = 'GPAY' then begin
                                                GrossPay := ObjEmployeePeriodTransactions.Amount;
                                                GrosspayTotal := (GrosspayTotal + (ObjEmployeePeriodTransactions.Amount));
                                            end else
                                                if ObjEmployeePeriodTransactions."Transaction Code" = 'E_0005' then begin
                                                    VarLeaveAllowance := ObjEmployeePeriodTransactions.Amount;
                                                    TotalVarLeaveAllowance := (TotalVarLeaveAllowance + (ObjEmployeePeriodTransactions.Amount));
                                                end else
                                                    if ObjEmployeePeriodTransactions."Transaction Code" = 'E_0001' then begin
                                                        VarHouseAllowance := ObjEmployeePeriodTransactions.Amount;
                                                    end else
                                                        if ObjEmployeePeriodTransactions."Transaction Code" = 'E_0002' then begin
                                                            VarActingAllowance := ObjEmployeePeriodTransactions.Amount;
                                                        end else
                                                            if ObjEmployeePeriodTransactions."Transaction Code" = 'E_0006' then begin
                                                                VarSalaryArrears := ObjEmployeePeriodTransactions.Amount;
                                                            end else
                                                                if ObjEmployeePeriodTransactions."Transaction Code" = 'E_0007' then begin
                                                                    Bonuses := ObjEmployeePeriodTransactions.Amount;
                                                                end else
                                                                    if ObjEmployeePeriodTransactions."Transaction Code" = 'E_0009' then begin
                                                                        VarEOY := ObjEmployeePeriodTransactions.Amount;
                                                                    end else
                                                                        if ObjEmployeePeriodTransactions."Transaction Code" = 'E_0010' then begin
                                                                            VarMileageAllowance := ObjEmployeePeriodTransactions.Amount;
                                                                        end else
                                                                            if ObjEmployeePeriodTransactions."Transaction Code" = 'E_0015' then begin
                                                                                VarOtherTaxableBenefits := ObjEmployeePeriodTransactions.Amount;
                                                                            end else
                                                                                if ObjEmployeePeriodTransactions."Transaction Code" = 'E_0016' then begin
                                                                                    VarOtherNonTaxableBenefits := ObjEmployeePeriodTransactions.Amount;
                                                                                    TotalVarActingAllowance := (TotalVarActingAllowance + (ObjEmployeePeriodTransactions.Amount));
                                                                                end else
                                                                                    if ObjEmployeePeriodTransactions."Transaction Code" = 'D_0006' then begin
                                                                                        Advance := ObjEmployeePeriodTransactions.Amount;
                                                                                    end else
                                                                                        if ObjEmployeePeriodTransactions."Transaction Code" = 'D_0007' then begin
                                                                                            Pension := ObjEmployeePeriodTransactions.Amount;
                                                                                            TotalPension := (TotalPension + (ObjEmployeePeriodTransactions.Amount));
                                                                                        end else
                                                                                            if ObjEmployeePeriodTransactions."Transaction Code" = 'D_0009' then begin
                                                                                                HelbLoan := ObjEmployeePeriodTransactions.Amount;
                                                                                                TotalHelbLoan := (TotalHelbLoan + (ObjEmployeePeriodTransactions.Amount));
                                                                                            end else
                                                                                                if ObjEmployeePeriodTransactions."Transaction Code" = 'TXBP' then begin
                                                                                                    TaxablePay := ObjEmployeePeriodTransactions.Amount;
                                                                                                    TotalTaxablePay := (TotalTaxablePay + (ObjEmployeePeriodTransactions.Amount));
                                                                                                end else
                                                                                                    if ObjEmployeePeriodTransactions."Transaction Code" = 'PAYE' then begin
                                                                                                        PAYEamount := ObjEmployeePeriodTransactions.Amount;
                                                                                                        PAYEamountTotal := (PAYEamountTotal + (ObjEmployeePeriodTransactions.Amount));
                                                                                                    end else
                                                                                                        if ObjEmployeePeriodTransactions."Transaction Code" = 'D_0016' then begin
                                                                                                            Deposits := ObjEmployeePeriodTransactions.Amount;
                                                                                                        end else
                                                                                                            if ObjEmployeePeriodTransactions."Transaction Code" = 'D_0017' then begin
                                                                                                                VarHouseLevy := ObjEmployeePeriodTransactions.Amount;
                                                                                                            end else
                                                                                                                if ObjEmployeePeriodTransactions."Transaction Code" = 'D_0008' then begin
                                                                                                                    VoluntaryPension := ObjEmployeePeriodTransactions.Amount;
                                                                                                                    TotalDeposits := (TotalDeposits + (ObjEmployeePeriodTransactions.Amount));
                                                                                                                end else
                                                                                                                    if ObjEmployeePeriodTransactions."Transaction Code" = 'TOT-DED' then begin
                                                                                                                        TotalDeductions := ObjEmployeePeriodTransactions.Amount;
                                                                                                                        TotalDeductionsTotal := (TotalDeductionsTotal + (ObjEmployeePeriodTransactions.Amount));
                                                                                                                    end;
                    end;
                    until ObjEmployeePeriodTransactions.Next = 0;
                end;
                if (NetPay <> 0) and (GrossPay <> 0) then begin
                    VarStatutoryRule := ROUND((NetPay / GrossPay) * 100, 1, '=');
                    VarStatutoryRuleText := Format(VarStatutoryRule) + '%';
                    VarHRRule := ROUND((LoansDeductions / (NetPay + LoansDeductions)) * 100, 1, '=');
                    VarHRRuleText := Format(VarHRRule) + '%';
                end;
                if ((BasicPay = 0) or ("Payroll Employee."."No." = '')) then
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
                group(Control2)
                {
                    field("Payroll Period"; VarPayrollPeriod)
                    {
                        ApplicationArea = Basic;
                        TableRelation = "Payroll Calender.";
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
        CompanyInfo.Get();
        CompanyInfo.CalcFields(CompanyInfo.Picture);
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
        Company: Record "Company Information";
        SFactory: Codeunit "SURESTEP Factory";
        VarAmountinArrears: Decimal;
        ObjRepaymentSchedule: Record "Loan Repayment Schedule";
        VarCount: Integer;
        VarDepositsBal: Decimal;
        VarShareCapitalBal: Decimal;
        ObjCust: Record "Members Register";
        ObjEmployeePeriodTransactions: Record "prPeriod Transactions.";
        VarPayrollPeriod: Date;
        NetPay: Decimal;
        NetPayTotal: Decimal;
        PAYEamount: Decimal;
        PAYEamountTotal: Decimal;
        NSSFAmount: Decimal;
        NSSFAmountTotal: Decimal;
        NHIFAmount: Decimal;
        NHIFAmountTotal: Decimal;
        BasicPay: Decimal;
        BasicPayTotal: Decimal;
        GrossPay: Decimal;
        GrosspayTotal: Decimal;
        VarLeaveAllowance: Decimal;
        TotalVarLeaveAllowance: Decimal;
        VarActingAllowance: Decimal;
        TotalVarActingAllowance: Decimal;
        HouseAllowance: Decimal;
        TotalHouseAllowance: Decimal;
        Bonuses: Decimal;
        TotalBonuses: Decimal;
        OtherAllowances: Decimal;
        TotalOtherAllowances: Decimal;
        Pension: Decimal;
        TotalPension: Decimal;
        NonTaxablePay: Decimal;
        TotalNonTaxablePay: Decimal;
        TaxablePay: Decimal;
        TotalTaxablePay: Decimal;
        HelbLoan: Decimal;
        TotalHelbLoan: Decimal;
        VoluntaryDeduction: Decimal;
        TotalVoluntaryDeduction: Decimal;
        Advance: Decimal;
        TotalAdvance: Decimal;
        LoansDeductions: Decimal;
        TotalLoansDeductions: Decimal;
        Deposits: Decimal;
        TotalDeposits: Decimal;
        CompanyInfo: Record "Company Information";
        TotalDeductions: Decimal;
        TotalDeductionsTotal: Decimal;
        VarHouseLevy: Decimal;
        VarSalaryArrears: Decimal;
        VarEOY: Decimal;
        VarMileageAllowance: Decimal;
        VarOtherTaxableBenefits: Decimal;
        VarOtherNonTaxableBenefits: Decimal;
        VoluntaryPension: Decimal;
        VarStatutoryRule: Decimal;
        VarStatutoryRuleText: Text;
        VarHRRule: Decimal;
        VarHRRuleText: Text;
        VarHouseAllowance: Decimal;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        [WithEvents]
        ReportForNav: DotNet ForNavReport51516150_v6_3_0_2259;
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
