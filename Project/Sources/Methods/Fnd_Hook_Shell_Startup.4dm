//%attributes = {"shared":true}
// ----------------------------------------------------
// Project Method: Fnd_Hook_Shell_Startup

// Place any startup code here that you want to run while the startup
//   dialog is displayed.
// You can also call your startup stuff before or after Fnd_Shell_OnStartup
//   is called from the On Startup database method.

// Method Type: Public

// Parameters: None

// Returns: Nothing
// Modified by Dave Batton on Aug 29, 2004
//   Added some code to handle money formats.
// ----------------------------------------------------




WGD_Init

//API On Start Process ("WGD_Init")

Fnd_Bttn_AlternativePicturePath(Get 4D folder:C485(Current resources folder:K5:16)+"Images"+Folder separator:K24:12)


//<Run 4DPop>
If (Not:C34(Is compiled mode:C492))
	
	ARRAY TEXT:C222($tTxt_components; 0x0000)
	COMPONENT LIST:C1001($tTxt_components)
	
	If (Find in array:C230($tTxt_components; "4DPop")>0)
		
		EXECUTE METHOD:C1007("4DPop_Palette")
		
	End if 
End if 
//</Run 4DPop>

If (Fnd_Pref_GetBoolean("Display Contacts at Startup"; False:C215))
	Fnd_IO_DisplayTable(->[Client:4])  // Display the Contacts table window.
End if 

If (Fnd_Pref_GetBoolean("Display Control Centre at Startup"; True:C214))
	Show Splash
End if 



