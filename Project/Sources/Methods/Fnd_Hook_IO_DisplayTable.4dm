//%attributes = {"shared":true}
// ----------------------------------------------------
// Project Method: Fnd_Hook_IO_DisplayTable

// This hook is called just before an output window is displayed.
// Here you can set the initial selection of records to display, configure the
//   toolbar, set the window title, or set the window position.

// Method Type: Public

// Parameters: None

// Returns: Nothing
// ----------------------------------------------------

WGD_Init

READ ONLY:C145(*)


//READ WRITE(Fnd_Gen_CurrentTable ->)

// Use Fnd_Gen_CurrentTable to determine the current table.

// To change the default output form:
//  Fnd_IO_OutputFormName ("MyOutput")

// Examples of commands to modify the toolbar:
//   Fnd_IO_ToolbarIconGroup ("Card")  ` Options: Bold/Card/Native
//   Fnd_Tlbr_Style ("Small1")  ` Options: Large/Small1/Small2
//   Fnd_Tlbr_Divider_Add 
//   Fnd_Tlbr_Button_Add ("BttnName";"Preferences";"Fnd_Bttn_Settings";"Fnd_Pref_Display")

//Fnd_Tlbr_Style ("Small2")
//Fnd_Tlbr_Style ("Large")

//Case of 
//: (Fnd_Gen_CurrentTable =(->[Dog]))
//Fnd_Tlbr_Style ("Small2")

//: (Fnd_Gen_CurrentTable =(->[Products]))
//Fnd_IO_ToolbarIconGroup ("Card")
//Fnd_IO_MultiWindow (False)  // Display the input form in the same window as the output form.
//Fnd_IO_AddMultipleRecords (True)  // Add new records until Cancel is clicked.
//End case 

//Fnd_Tlbr_Button_Add ("Pooch";"Logo";"Logo";"Fnd_Pref_Display")
