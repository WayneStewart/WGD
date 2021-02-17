C_LONGINT:C283($Selected_i)

SLCT_SetFields(->[Template:10]; ->[Template:10]Title:2)
SLCT_RowHeight(19)
SLCT_SetFormText("Choose Template"; \
"Please select the template you wish to use…")


If (Fnd_Gen_Platform=Windows:K25:3)
	Fnd_Wnd_Position(Fnd_Wnd_CenterOnWindow)
	Fnd_Wnd_Type(Movable form dialog box:K39:8)
Else 
	Fnd_Wnd_Type(Resizable sheet window:K34:16)
End if 

$Selected_i:=SLCT_Record(->[Template:10]; "All")

If ($Selected_i>-1)
	GOTO RECORD:C242([Template:10]; $Selected_i)
	[Training:7]Session_Notes:8:=[Template:10]Docco:3
	
	
End if 


UTIL_UnloadRecordReduceSelect(->[Template:10])