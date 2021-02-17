//%attributes = {"shared":true}
// ----------------------------------------------------
// Project Method: Fnd_Hook_Shell_InitializePlugIns

// Use this method to initialize any plug-ins by calling their activation routines.
// Called at Startup.

// Access Type: Public

// Parameters: None

// Returns: Nothing
// ----------------------------------------------------


C_LONGINT:C283($Result_i; $Platform_i)
_O_PLATFORM PROPERTIES:C365($Platform_i)

// These are the new v2.0 codes for PDF Viewer
If ($Platform_i=Windows:K25:3)
	$Result_i:=PDFV Register("6I92U24KG7838T")
Else 
	$Result_i:=PDFV Register("2LT2L3E04Z048N")
End if 

If ($Result_i=0)
	Fnd_Dlg_Alert("PDF Viewer Registration Error")
End if 

//  NTK Version 3.x
//If ($Platform_i=Windows)
//$Result_i:=NTK Register ("PD6TP76XE51X05")
//Else 
//$Result_i:=NTK Register ("VKK09AJQ11XWM2")
//End if 


//If ($Result_i=0)
//Fnd_Dlg_Alert ("NTK Registration Error")
//End if 

