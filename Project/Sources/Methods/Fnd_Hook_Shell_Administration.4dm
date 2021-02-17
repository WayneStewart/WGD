//%attributes = {"shared":true}
// ----------------------------------------------------
// Project Method: Fnd_Hook_Shell_Administration

// Called to display the shell's Administration dialog.

// Method Type: Public

// Parameters: None

// Returns: Nothing
// ----------------------------------------------------

Fnd_List_AddItem(Fnd_Loc_GetString("Loc_General"; "EditCompanyInfo"); "Company_EditSettings")


// Access to 4D's Password Editor
Fnd_List_AddItem(Fnd_Loc_GetString("Fnd_Shell"; "PasswordEditor"); Command name:C538(281))

// Foundation's List Editor
Fnd_List_AddItem(Fnd_Loc_GetString("Fnd_Shell"; "ListEditor"); "Fnd_List_Editor")

// Foundation's Sequence Number Editor
Fnd_List_AddItem(Fnd_Loc_GetString("Fnd_Shell"; "SequenceNumberEditor"); "Fnd_SqNo_Editor")

// Import & Export Editors
Fnd_List_AddItem(Fnd_Loc_GetString("Fnd_Shell"; "ImportEditor"); Command name:C538(665)+"(\"\")")
Fnd_List_AddItem(Fnd_Loc_GetString("Fnd_Shell"; "ExportEditor"); Command name:C538(666)+"(\"\")")

// Display the selection dialog.
Fnd_List_CommandDialog