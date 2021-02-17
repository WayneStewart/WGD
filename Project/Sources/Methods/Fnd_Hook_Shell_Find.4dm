//%attributes = {"shared":true}
// ----------------------------------------------------
// Project Method: Fnd_Hook_Shell_Find

// A hook for setting up Foundation's Find dialog before it's displayed.
// Call Fnd_Gen_CurrentTable to determine the table in use.

// Method Type: Public

// Parameters: None

// Returns: Nothing
// ----------------------------------------------------

Case of 
	: (Macintosh option down:C545)  // Also works for the Windows' Alt key.
		Fnd_Menu_QueryEditor  // Display 4D's Query Editor.
		
		//: (Fnd_Gen_CurrentTable =(->[Client]))
		//ARRAY POINTER(Contacts_FindFields_aptr;3)
		//Contacts_FindFields_aptr{1}:=->[Client]PrimaryContact
		//Contacts_FindFields_aptr{2}:=->[Client]Alternate_01
		//Contacts_FindFields_aptr{3}:=->[Client]Alternate_02
		//Fnd_Find_AddMultiField (->Contacts_FindFields_aptr;Fnd_Loc_GetString ("Loc_Contacts";"AnyNameField"))
		//Fnd_Find_AddSeparator 
		
		//Fnd_Find_AddTable (Fnd_Gen_CurrentTable )
		//Fnd_Find_AddSeparator 
		//Fnd_Find_AddField (->[Dog]Name)
		
		//Fnd_Find_Display 
		//ARRAY POINTER(Contacts_FindFields_aptr;0)  // Clear the array.
		
	Else 
		Fnd_Find_Display
End case 

