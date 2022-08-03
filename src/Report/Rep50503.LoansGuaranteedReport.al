#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
// dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
// {
//     assembly("ForNav.Reports.6.3.0.2259")
//     {
//         type(ForNav.Report_6_3_0_2259; ForNavReport51516503_v6_3_0_2259) { }
//     }
// } // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50503 "Loans Guaranteed Report"
{
    RDLCLayout = './Layouts/LoansGuaranteedReport.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Members Register"; Customer)
        {
            CalcFields = "Current Shares";
            RequestFilterFields = "No.", Name;
            //column(ReportForNavId_1000000000; 1000000000) { } // Autogenerated by ForNav - Do not delete
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(Company_Name; Company.Name)
            {
            }
            column(Company_Address; Company.Address)
            {
            }
            column(Company_Address_2; Company."Address 2")
            {
            }
            column(Company_Phone_No; Company."Phone No.")
            {
            }
            column(Company_Fax_No; Company."Fax No.")
            {
            }
            column(Company_Picture; Company.Picture)
            {
            }
            column(Company_Email; Company."E-Mail")
            {
            }
            // column(CurrReport_PAGENO; Format(ReportForNav.PageNo))
            // {
            // }
            column(UserId; UserId)
            {
            }
            column(No_Members; "Members Register"."No.")
            {
            }
            column(RNo; RNo)
            {
            }
            column(AvailableSH; AvailableSH)
            {
            }
            column(Name_Members; "Members Register".Name)
            {
            }
            column(PhoneNo_Members; "Members Register"."Phone No.")
            {
            }
            column(OutstandingBalance_Members; "Members Register"."Outstanding Balance")
            {
            }
            column(PayrollNo_MembersRegister; "Members Register"."Payroll No")
            {
            }
            column(CurrentShares_MembersRegister; "Members Register"."Current Shares")
            {
            }
            dataitem("Loans Guarantee Details"; "Loans Guarantee Details")
            {
                DataItemLink = "Member No" = field("No.");
                DataItemTableView = where("Outstanding Balance" = filter(> 0), Substituted = filter(false));
                RequestFilterFields = "Member No", "Loan No";
                //column(ReportForNavId_1000000001; 1000000001) { } // Autogenerated by ForNav - Do not delete
                column(AmontGuaranteed_LoanGuarantors; "Loans Guarantee Details"."Amont Guaranteed")
                {
                }
                column(NoOfLoansGuaranteed_LoanGuarantors; "Loans Guarantee Details"."No Of Loans Guaranteed")
                {
                }
                column(Name_LoanGuarantors; "Loans Guarantee Details".Name)
                {
                }
                column(MemberNo_LoanGuarantors; "Loans Guarantee Details"."Member No")
                {
                }
                column(LoanNo_LoanGuarantors; "Loans Guarantee Details"."Loan No")
                {
                }
                column(LoanProduct_BOSALoansGuarantors; "Loans Guarantee Details"."Loan Product")
                {
                }
                column(ProductDescription; LoanProductsSetup."Product Description")
                {
                }
                column(No; no)
                {
                }
                column(OutstandingBalance_LoanGuarantors; "Loans Guarantee Details"."Outstanding Balance")
                {
                }
                column(OutstandingBAlSt; OutstandingBAlSt)
                {
                }
                column(OutStandingBal; OutStandingBal)
                {
                }
                column(TotalOutstandingBal; TotalOutstandingBal)
                {
                }
                column(FNo; FNo)
                {
                }
                column(AmountGuar; AmountGuar)
                {
                }
                column(LoaneesName_LoanGuarantors; "Loans Guarantee Details"."Loanees  Name")
                {
                }
                column(LoaneesNo_LoanGuarantors; "Loans Guarantee Details"."Loanees  No")
                {
                }
                column(SubNo; "Loans Guarantee Details"."Substituted Guarantor")
                {
                }
                column(SubName; "Loans Guarantee Details"."Share capital")
                {
                }
                column(VarCurrLiability; VarCurrLiability)
                {
                }
                column(AvailableSH2; AvailableSH)
                {
                }
                dataitem("Loans Register"; "Loans Register")
                {
                    DataItemLink = "Loan  No." = field("Loan No");
                    DataItemTableView = sorting("Loan  No.") order(ascending) where(Posted = const(true));
                    //column(ReportForNavId_1000000017; 1000000017) { } // Autogenerated by ForNav - Do not delete
                    column(Client_Code; "Loans Register"."Client Code")
                    {
                    }
                    column(Client_Name; "Loans Register"."Client Name")
                    {
                    }
                    column(EmployerCode_Loans; "Loans Register"."Employer Code")
                    {
                    }
                    column(ApplicationDate_LoansRegister; "Loans Register"."Application Date")
                    {
                    }
                    column(OutstandingBalance_Loans; "Loans Register"."Outstanding Balance")
                    {
                    }
                    column(ApprovedAmount_LoansRegister; "Loans Register"."Approved Amount")
                    {
                    }
                    column(LoanDisbursementDate_LoansRegister; "Loans Register"."Loan Disbursement Date")
                    {
                    }
                    column(OutStandingBal2; OutStandingBal)
                    {
                    }
                    column(TotalOutstandingBal2; TotalOutstandingBal)
                    {
                    }
                    trigger OnPreDataItem();
                    begin
                        OutStandingBal := 0;
                        TotalOutstandingBal := 0;
                        OutStandingBal := OutStandingBal;
                        TotalOutstandingBal := TotalOutstandingBal;
                    end;

                }
                trigger OnAfterGetRecord();
                begin
                    //Loan.GET();
                    OutstandingBAlSt := 0;
                    Loansr.Reset;
                    Loansr.SetRange(Loansr."Loan  No.", "Loan No");
                    if "Loans Register".Find('-') then //BEGIN
                        Loansr.CalcFields(Loansr."Outstanding Balance");
                    MemberNo := Loansr."Client Code";
                    MemberName := Loansr."Client Name";
                    EmployerCode := Loansr."Employer Code";
                    OutstandingBAlSt := Loansr."Outstanding Balance";
                    FNo := FNo + 1;
                    VarCurrLiability := 0;
                    //END;
                    AmountGuar := AmountGuar + "Amont Guaranteed";
                    "Loans Guarantee Details".CalcFields("Loans Guarantee Details"."Total Loans Guaranteed");
                    if ObjLoans.Get("Loans Guarantee Details"."Loan No") then begin
                        ObjLoans.CalcFields(ObjLoans."Outstanding Balance");
                        if ObjLoans."Outstanding Balance" > 0 then begin
                            if "Loans Guarantee Details"."Total Loans Guaranteed" <> 0 then begin
                                VarCurrLiability := ROUND(("Loans Guarantee Details"."Amont Guaranteed" / "Loans Guarantee Details"."Total Loans Guaranteed") * ObjLoans."Outstanding Balance", 0.5, '=');
                            end;
                        end;
                    end;
                    Cust.CalcFields(Cust."Outstanding Balance", Cust."Current Shares", Cust."Loans Guaranteed");
                    //AvailableSH:=Cust."Current Shares"-Cust."Loans Guaranteed";
                    AvailableSH := Cust."Current Shares" - VarCurrLiability;
                    if LoanProductsSetup.Get("Loans Guarantee Details"."Loan Product") then;
                end;

            }
            trigger OnPreDataItem();
            begin
                LastFieldNo := FieldNo("No.");
                RNo := RNo + 1;
                Company.Get();
                Company.CalcFields(Company.Picture);
            end;

            trigger OnAfterGetRecord();
            begin
                RNo := 1;
                /*//RNo:=INCSTR(FORMAT(RNo));
				Cust.CALCFIELDS(Cust."Outstanding Balance",Cust."Current Shares",Cust."Loans Guaranteed");
				AvailableSH:=Cust."Current Shares"-Cust."Loans Guaranteed";
				Cust.RESET;
				Cust.SETRANGE(Cust."No.","No.");
				IF Cust.FIND('-') THEN BEGIN
				REPEAT
				UNTIL Cust.NEXT=0;
				END;
				*/

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
                    // field(ForNavOpenDesigner; ReportForNavOpenDesigner)
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Design';
                    //     Visible = ReportForNavAllowDesign;
                    //     trigger OnValidate()
                    //     begin
                    //         ReportForNav.LaunchDesigner(ReportForNavOpenDesigner);
                    //         CurrReport.RequestOptionsPage.Close();
                    //     end;

                    // }
                }
            }
        }

        actions
        {
        }
        trigger OnOpenPage()
        begin
            // ReportForNavOpenDesigner := false;
        end;
    }

    trigger OnInitReport()
    begin
        ;
        //ReportsForNavInit;

    end;

    trigger OnPostReport()
    begin
        ;
        //ReportForNav.Post;
    end;

    trigger OnPreReport()
    begin
        ;
        //  ReportsForNavPre;
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        AvailableSH: Decimal;
        MemberNo: Text;
        MemberName: Text;
        EmployerCode: Text;
        Loansr: Record "Loans Register";
        no: Integer;
        TotalOutstandingBal: Decimal;
        OutStandingBal: Decimal;
        FNo: Integer;
        AmountGuar: Decimal;
        OutstandingBAlSt: Decimal;
        RNo: Integer;
        Cust: Record Customer;
        Company: Record "Company Information";
        VarCurrLiability: Decimal;
        ObjLoans: Record "Loans Register";
        LoanProductsSetup: Record "Loan Products Setup";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    // var
    //     [WithEvents]
    //     ReportForNav: DotNet ForNavReport51516503_v6_3_0_2259;
    //     ReportForNavOpenDesigner: Boolean;
    //     [InDataSet]
    //     ReportForNavAllowDesign: Boolean;

    // local procedure ReportsForNavInit();
    // var
    //     ApplicationSystemConstants: Codeunit "Application System Constants";
    //     addInFileName: Text;
    //     tempAddInFileName: Text;
    //     path: DotNet Path;
    //     ReportForNavObject: Variant;
    // begin
    //     addInFileName := ApplicationPath() + 'Add-ins\ReportsForNAV_6_3_0_2259\ForNav.Reports.6.3.0.2259.dll';
    //     if not File.Exists(addInFileName) then begin
    //         tempAddInFileName := path.GetTempPath() + '\Microsoft Dynamics NAV\Add-Ins\' + ApplicationSystemConstants.PlatformFileVersion() + '\ForNav.Reports.6.3.0.2259.dll';
    //         if not File.Exists(tempAddInFileName) then
    //             Error('Please install the ForNAV DLL version 6.3.0.2259 in your service tier Add-ins folder under the file name "%1"\\If you already have the ForNAV DLL on the server, you should move it to this folder and rename it to match this file name.', addInFileName);
    //     end;
    //     ReportForNavObject := ReportForNav.GetLatest(CurrReport.OBJECTID, CurrReport.Language, SerialNumber, UserId, CompanyName);
    //     ReportForNav := ReportForNavObject;
    //     ReportForNav.Init();
    // end;

    // local procedure ReportsForNavPre();
    // begin
    //     ReportForNav.OpenDesigner := ReportForNavOpenDesigner;
    //     if not ReportForNav.Pre() then CurrReport.Quit();
    // end;

    // // Reports ForNAV Autogenerated code - do not delete or modify -->
}
