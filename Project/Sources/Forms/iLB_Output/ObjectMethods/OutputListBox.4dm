C_LONGINT:C283($iTable; $iView)
C_TEXT:C284($highlightedRecords_t; $recordsInSelection_t; $recordsInTable_t)
C_POINTER:C301($ptrObject)

$ptrObject:=->OutputListBox

Case of 
	: (Form event code:C388=On Load:K2:1)
		C_LONGINT:C283(OutputListBox)  // Oct 22, 2009 22:51:33 -- I.Barclay Berry 
		
		iLB_Init_NewProcess
		$iTable:=Table:C252(Fnd_Gen_CurrentTable)
		$iView:=-1
		
		iLB_Current_View($ptrObject; $iView)  //set the view
		iLB_Current_Table(Self:C308; $iTable)  //set listbox table
		
		iLB_Load_Form(Self:C308; $iTable; $iView)
		
		_O_ARRAY STRING:C218(80; Output_asViews; 0)  //arrays to setup view popup menu
		ARRAY LONGINT:C221(Output_aiViews; 0)
		
		iLB_Load_ViewArrays($iTable; $iView; ->Output_aiViews; ->Output_asViews)  //fill popup menu arrays
		
		If (Size of array:C274(Output_asViews)=1)  //only 1 view and no editing
			OBJECT SET VISIBLE:C603(Output_asViews; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(Output_asViews; True:C214)
		End if 
		
		iLB_Current_View($ptrObject; Abs:C99($iView))  //if was neg num change to positive
		
		$highlightedRecords_t:=String:C10(Records in set:C195(iLB_Get_SetName($ptrObject)))
		$recordsInSelection_t:=String:C10(Records in selection:C76(Table:C252($iTable)->))  // Modified by: Walt Nelson (5/27/11) per Barclay
		$recordsInTable_t:=String:C10(Records in table:C83(Table:C252($iTable)->))  // Modified by: Walt Nelson (5/27/11) per Barclay
		Fnd_Tlbr_StatusMessage(Fnd_Loc_GetString("Fnd_IO"; "SelectionDescription"; $highlightedRecords_t; $recordsInSelection_t; $recordsInTable_t))
		
	Else 
		
		iLB_ObjectMethod($ptrObject; Self:C308)
End case 


If (Form event code:C388=On Selection Change:K2:29)  //  Click
	//get user selected rows and change the "userset"
	//COPY SET("$OutputListBoxUserSet";"UserSet")
	COPY SET:C600("OutputListBoxUserSet"; "UserSet")
	
	//
	If (Fnd_Tlbr_StatusMessage#"")  // DB070129 - Added this test.
		$highlightedRecords_t:=String:C10(Records in set:C195(iLB_Get_SetName($ptrObject)))
		$recordsInSelection_t:=String:C10(Records in selection:C76(Table:C252(iLB_Current_Table($ptrObject))->))
		$recordsInTable_t:=String:C10(Records in table:C83(Table:C252(iLB_Current_Table($ptrObject))->))
		Fnd_Tlbr_StatusMessage(Fnd_Loc_GetString("Fnd_IO"; "SelectionDescription"; $highlightedRecords_t; $recordsInSelection_t; $recordsInTable_t))
	End if   // DB070129
	
	Fnd_IO_UpdateToolbar
	Fnd_Menu_MenuBar
	Fnd_Gen_SelectionChanged
End if 