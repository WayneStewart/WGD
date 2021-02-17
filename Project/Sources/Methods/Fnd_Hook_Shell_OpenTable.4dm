//%attributes = {"shared":true}
// ----------------------------------------------------
// Project Method: Fnd_Hook_Shell_OpenTable

// A hook for setting up Foundation's Open Table dialog before it's displayed.
// Call Fnd_Shell_OpenTableAdd to specify the table names to display.

// Method Type: Public

// Parameters: None

// Returns: Nothing
// ----------------------------------------------------

Fnd_Shell_OpenTableAdd(->[Client:4])  // We can add them one at a time...
Fnd_Shell_OpenTableAdd(->[Dog:6]; ->[PDF:5])  //  ...or all at once.

Fnd_Shell_OpenTableDialog
