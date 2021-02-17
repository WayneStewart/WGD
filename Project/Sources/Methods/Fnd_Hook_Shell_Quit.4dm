//%attributes = {"shared":true}
// ----------------------------------------------------
// Project Method: Fnd_Hook_Shell_Quit --> Boolean

// Called when quitting the database, just before Foundation calls QUIT 4D.
// Return True to allow Foundation to quit the application normally.
// Return False to abort the quit.

// Method Type: Public

// Parameters: None

// Returns:
//   $0 : Boolean : Allow Foundation to quit?
// ----------------------------------------------------
C_BOOLEAN:C305($0)

C_LONGINT:C283($Found_i)

ARRAY TEXT:C222($components_at; 0)

If (False:C215)
	C_BOOLEAN:C305(Fnd_Hook_Shell_Quit; $0)
End if 



// This is a good place to clear or reset any variables so they're fresh
//   when you relaunch the database during development without actually
//   quitting 4D.

COMPONENT LIST:C1001($components_at)

$Found_i:=Find in array:C230($components_at; "@ilb@")
If ($Found_i>0)
	EXECUTE METHOD:C1007("iLB_ShutDown")
End if 



$0:=True:C214  // Allow the application to quit.

