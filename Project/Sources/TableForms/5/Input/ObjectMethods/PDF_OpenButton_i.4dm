// ------------------------------------------------------------
// Object Method: PDF_OpenButton_i
//   Wayne Stewart waynestewart@mac.com
//   Sep 28, 2006
// ------------------------------------------------------------
If (BLOB size:C605([PDF:5]PDF_x:5)>0)
	Fnd_Wnd_Position(Fnd_Wnd_MacOSXSheet)
	Fnd_Dlg_CustomIcon("WGD Logo")
	Fnd_Dlg_SetText("Are you sure you want to replace the existing pdf?"; "There is no way to retrieve the current image once this record has been saved.")
	Fnd_Dlg_SetButtons("Replace"; "Cancel")
	Fnd_Dlg_Display
	
	If (OK=1)
		PDF_Import
	End if 
Else 
	PDF_Import
	
End if 

