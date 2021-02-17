//%attributes = {"shared":true}
// ----------------------------------------------------
// Project Method: Fnd_Hook_Rec_New (->table) --> Boolean

// A hook that gets called when the user wants to add a new record.
// Return True to allow Foundation to allow Foundation to handle the request.
// Return False if you want to handle the request yourself.

// Method Type: Public

// Parameters: 
//   $1 : Pointer : The new record's table

// Returns:
//   $0 : Boolean : Allow Foundation to handle the request?
// ----------------------------------------------------

C_BOOLEAN:C305($0)
C_POINTER:C301($1)

$0:=True:C214  // True = Let Foundation handle it.
