C_LONGINT:C283($iTable; $iView)
C_POINTER:C301($ptrListBox)

$ptrListBox:=->OutputListBox

Case of 
	: (Form event code:C388=On Load:K2:1)
		//handle in ListBox On Load phase
		
	: (Form event code:C388=On Clicked:K2:4)
		//change the view
		$iView:=Output_aiViews{Output_asViews}  //get the view number
		If ($iView=-1)  //edit views
			iLB_Editor_Display(iLB_Current_Table($ptrListBox); Output_aiViews{Output_aiViews})  //edit previously viewed view
			Output_asViews:=iLB_Current_View($ptrListBox)  //iLB_aiViews  `reset to previous view
			iLB_Refresh_View:=True:C214
		Else 
			$iTable:=iLB_Current_Table($ptrListBox)
			iLB_Load_Form($ptrListBox; $iTable; $iView)
			iLB_Current_View($ptrListBox; $iView)  //set to the new view begin displayed
		End if 
		
		Output_aiViews:=Output_asViews  //keep in sync
		
End case 
