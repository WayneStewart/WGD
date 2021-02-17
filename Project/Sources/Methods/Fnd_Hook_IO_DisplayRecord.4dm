//%attributes = {"shared":true}
// ----------------------------------------------------
// Project Method: Fnd_Hook_IO_DisplayRecord

// This hook is called just before an input window is displayed.
// Here you can set the window title or position, or specify the
//   input form to use.

// Method Type: Public

// Parameters: None

// Returns: Nothing
// ----------------------------------------------------

WGD_Init

READ ONLY:C145(*)
READ WRITE:C146(Fnd_Gen_CurrentTable->)

iLB_Init_NewProcess


Case of 
		//: (Fnd_Gen_CurrentTable =(->[(Company Info)]))
		//Fnd_Wnd_Title (Fnd_Loc_GetString ("Loc_Company";"CompanySettings"))
		//Fnd_Wnd_Type (Plain fixed size window)
		//Fnd_Wnd_CloseBox (False)
		//Fnd_IO_DisplayNavButtons (False)
		
		
		//Fnd_Menu_Window_Add 
End case 
