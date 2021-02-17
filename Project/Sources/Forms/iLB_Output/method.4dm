// Jun 12, 2010 00:57:18 -- I.Barclay Berry --- Modfied version of Fnd_IO_OutputFormMethod

C_POINTER:C301($ptrObject)
C_TEXT:C284($highlightedRecords_t; $recordsInSelection_t; $recordsInTable_t; $prefix_t)
C_LONGINT:C283($iTable; $iView)

Fnd_IO_Init

Case of 
	: (Current process:C322=1)  // Don't do this stuff in the User process.
		
		
	: (Form event code:C388=On Load:K2:1)
		C_BOOLEAN:C305(iLB_Refresh_View)
		iLB_Refresh_View:=False:C215
		
		OBJECT SET VISIBLE:C603(*; "Fnd_IO_HideThis@"; False:C215)  // Hide our white background, marker guide positioning lines, and instructions.
		// We have invisible buttons that trap Enter, Esc, and Command-Period.
		//   Move them offscreen so they can't be accidentally clicked.
		OBJECT MOVE:C664(*; "Fnd_Tlbr_OffscreenButton@"; -2; -2; -1; -1; *)
		Fnd_Gen_SelectionChanged
		
		If (Fnd_Tlbr_Style#"Large")
			OBJECT GET COORDINATES:C663(*; "OutputListBox"; $Left_i; $Top_i; $Right_i; $Bottom_i)
			OBJECT SET COORDINATES:C1248(*; "OutputListBox"; $Left_i; $Top_i-25; $Right_i; $Bottom_i)
		End if 
		
		
		
	: ((Form event code:C388=On Header:K2:17) | (Form event code:C388=On Clicked:K2:4))
		Fnd_Gen_CurrentFormType(Fnd_Gen_OutputForm)  // It might have been switched if we displayed an input form.
		
		// Update the status message under the toolbar.
		$ptrObject:=->OutputListBox
		If (Fnd_Tlbr_StatusMessage#"")  // DB070129 - Added this test.
			$highlightedRecords_t:=String:C10(Records in set:C195(iLB_Get_SetName($ptrObject)))
			$recordsInSelection_t:=String:C10(Records in selection:C76(Table:C252(iLB_Current_Table($ptrObject))->))
			$recordsInTable_t:=String:C10(Records in table:C83(Table:C252(iLB_Current_Table($ptrObject))->))
			Fnd_Tlbr_StatusMessage(Fnd_Loc_GetString("Fnd_IO"; "SelectionDescription"; $highlightedRecords_t; $recordsInSelection_t; $recordsInTable_t))
		End if   // DB070129
		
		Fnd_IO_UpdateToolbar
		Fnd_Menu_MenuBar  // Update the items that are enabled/disabled.
		
		
	: (Form event code:C388=On Outside Call:K2:11)
		Case of 
			: ((Fnd_Wnd_CloseNow) | (Fnd_Gen_QuitNow))
				CANCEL:C270
			Else 
				// If we add a new record, another process may want us to add the
				//   new record to the end of the current selection.
				Fnd_Rec_AddToSelection(Fnd_IO_RecordEdited)
				
				If (iLB_Refresh_View)  //refresh in case user changed the layout
					If (Size of array:C274(Output_asViews)>1)
						$ptrObject:=->OutputListBox
						$iTable:=iLB_Current_Table($ptrObject)
						$iView:=iLB_Current_View($ptrObject)*-1
						iLB_Load_Form($ptrObject; $iTable; $iView)
						ARRAY LONGINT:C221(Output_aiViews; 0)
						_O_ARRAY STRING:C218(80; Output_asViews; 0)
						iLB_Load_ViewArrays($iTable; $iView; ->Output_aiViews; ->Output_asViews)  //fill popup menu arrays
					End if 
					iLB_Refresh_View:=False:C215
				End if 
				
		End case 
		
		
	: (Form event code:C388=On Double Clicked:K2:5)
		//handled by listbox
		
		
	: (Form event code:C388=On Activate:K2:9)
		C_BOOLEAN:C305(iLB_Refresh_View)
		iLB_Refresh_View:=True:C214
		
		
	: (Form event code:C388=On Close Box:K2:21)
		CANCEL:C270
		If (Macintosh option down:C545)
			Fnd_Wnd_CloseAllWindows
		End if 
End case 

Fnd_Tlbr_FormMethod

//If (@XX_AP Does method exist ("Fnd_Hook_IO_OutputFormMethod")=1)
EXECUTE METHOD:C1007("Fnd_Hook_IO_OutputFormMethod"; *)
//End if 