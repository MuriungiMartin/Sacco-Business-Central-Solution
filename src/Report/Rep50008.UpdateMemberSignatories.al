#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{	
	assembly("ForNav.Reports.6.3.0.2259")
	{
		type(ForNav.Report_6_3_0_2259; ForNavReport50008_v6_3_0_2259){}   
	}
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 50008 "Update Member Signatories"
{
	RDLCLayout = './Layouts/UpdateMemberSignatories.rdlc'; DefaultLayout = RDLC;

	dataset
	{
		dataitem("Member Signatories Buffer";"Member Signatories Buffer")
		{
			column(ReportForNavId_1; 1) {} // Autogenerated by ForNav - Do not delete
			trigger OnAfterGetRecord();
			begin
				if ObjNoSeries.Get then
				begin
				ObjNoSeries.TestField(ObjNoSeries."Signatories Document No");
				VarDocumentNo:=NoSeriesMgt.GetNextNo(ObjNoSeries."Signatories Document No",0D,true);
				if VarDocumentNo<>'' then
				  begin
				  ObjMemberSignatories.Init;
				  ObjMemberSignatories."Document No":=VarDocumentNo;
				  ObjMemberSignatories."Account No":="Member Signatories Buffer"."Account No";
				  ObjMemberSignatories."Member No.":="Member Signatories Buffer"."Member No";
				  ObjMemberSignatories.Names:="Member Signatories Buffer"."Member Name";
				  ObjMemberSignatories."ID No.":="Member Signatories Buffer"."ID No";
				  ObjMemberSignatories."Mobile No":="Member Signatories Buffer"."Mobile No";
				  ObjMemberSignatories."Email Address":="Member Signatories Buffer".Email;
				  ObjMemberSignatories."Signed Up For Mobile Banking":="Member Signatories Buffer"."Signed Up For Mobile Banking";
				  ObjMemberSignatories."Must Sign":="Member Signatories Buffer"."Must Sign";
				  ObjMemberSignatories."Withdrawal Limit":="Member Signatories Buffer"."WithDrawal Limit";
				  ObjMemberSignatories."Mobile Banking Limit":="Member Signatories Buffer"."Mobile Banking Limit";
				  ObjMemberSignatories."Operating Instructions":="Member Signatories Buffer"."Operating Instructions";
				  ObjMemberSignatories."Created By":="Member Signatories Buffer"."Created By";
				  ObjMemberSignatories."Created On":="Member Signatories Buffer"."Created On";
				  ObjMemberSignatories."Modified By":="Member Signatories Buffer"."Modified By";
				  ObjMemberSignatories."Modified On":="Member Signatories Buffer"."Modified On";
				  ObjMemberSignatories."Entry No":="Member Signatories Buffer"."Entry No";
				  ObjMemberSignatories.Insert;
				  end;
				end;
			end;
			
		}
	}

	requestpage
	{

  
		SaveValues = false;	  layout
		{
			area(content)
			{
				group(Options)
				{
					Caption = 'Options';
					field(ForNavOpenDesigner;ReportForNavOpenDesigner)
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
		;ReportsForNavInit;

	end;

	trigger OnPostReport()
	begin
		;ReportForNav.Post;
	end;

	trigger OnPreReport()
	begin
		;ReportsForNavPre;
	end;
	var
		ObjMemberSignatories: Record "FOSA Account Sign. Details";
		ObjNoSeries: Record "Sacco No. Series";
		VarDocumentNo: Code[30];
		NoSeriesMgt: Codeunit NoSeriesManagement;

	// --> Reports ForNAV Autogenerated code - do not delete or modify
	var 
		[WithEvents]
		ReportForNav : DotNet ForNavReport50008_v6_3_0_2259;
		ReportForNavOpenDesigner : Boolean;
		[InDataSet]
		ReportForNavAllowDesign : Boolean;

	local procedure ReportsForNavInit();
	var
		ApplicationSystemConstants: Codeunit "Application System Constants";
		addInFileName : Text;
		tempAddInFileName : Text;
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
		ReportForNav.OpenDesigner:=ReportForNavOpenDesigner;
		if not ReportForNav.Pre() then CurrReport.Quit();
	end;

	// Reports ForNAV Autogenerated code - do not delete or modify -->
}
