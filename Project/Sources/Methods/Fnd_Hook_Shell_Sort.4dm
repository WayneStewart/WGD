//%attributes = {"shared":true}
// ----------------------------------------------------
// Project Method: Fnd_Hook_Shell_Sort

// A hook for setting up Foundation's Sort dialog before it's displayed.
// Call Fnd_Gen_CurrentTable to determine the table in use.

// Method Type: Public

// Parameters: None

// Returns: Nothing
// ----------------------------------------------------

If (Macintosh option down:C545)  // Also works for the Windows' Alt key.
	Fnd_Menu_SortOrderEditor  // Display 4D's Order By Editor.
	
Else 
	// Case of                                                        --Example Code--
	//     : (Fnd_Gen_CurrentTable=(->[People]))
	//         Fnd_Sort_AddTable (Fnd_Gen_CurrentTable )
	//         Fnd_Sort_AddSeparator 
	//         Fnd_Sort_AddField (->[Companies]Company Name)
	// End case 
	
	Fnd_Sort_Display  // Display Foundation's Sort dialog.
End if 

