//%attributes = {"shared":true}
// ----------------------------------------------------
// Project Method: Fnd_Hook_Rec_Delete --> Boolean

// A hook that gets called before Foundation attempts to delete any records.
// Return True to allow Foundation to display a warning and delete the records.
// Return False if you want to handle the process yourself.

// Call Fnd_Gen_CurrentTable to determine the table in use.
// The "UserSet" set contains the records the user wants to delete.

// Method Type: Public

// Parameters: None

// Returns:
//   $0 : Boolean : Allow Foundation to handle the request?
// ----------------------------------------------------

C_BOOLEAN:C305($0)

$0:=True:C214  // Let Foundation handle it.
