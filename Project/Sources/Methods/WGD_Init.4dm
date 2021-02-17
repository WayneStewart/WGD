//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// Project Method: WGD_Init

// Initializes both the process and interprocess variables used by the WGD routines.
// Method Type:    Protected

// Created by Wayne Stewart (2017-07-17T14:00:00Z)
//     wayne@4dsupport.guru
// ----------------------------------------------------

C_BOOLEAN:C305(<>WGD_Initialised_b; WGD_Initialised_b)

If (Not:C34(<>WGD_Initialised_b))  // So we only do this once.
	Compiler_WGD
	<>WGD_o:=New object:C1471
	
	
	WGD_GetFonts
	<>WGD_Initialised_b:=True:C214
End if 

If (Not:C34(WGD_Initialised_b))  // So we only do this once.
	Compiler_WGD
	
	
	WGD_o:=New object:C1471
	WGD_Initialised_b:=True:C214
End if 