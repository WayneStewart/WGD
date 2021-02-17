//%attributes = {}
// ----------------------------------------------------
// Project Method: Compiler_WGD
// Compiler variables related to the WGD routines.
// Method Type: Private
// Parameters: None
// Returns: Nothing
// Created by Wayne Stewart (2017-07-17T14:00:00Z)
//     wayne@4dsupport.guru
// ----------------------------------------------------

// Interprocess Variables
C_BOOLEAN:C305(<>WGD_Initialised_b; WGD_Initialised_b)
If (Not:C34(<>WGD_Initialised_b))  // So we only do this once.
	C_OBJECT:C1216(<>WGD_o)
	
End if 

// Process Variables
If (Not:C34(WGD_Initialised_b))  // So we only do this once.
	C_OBJECT:C1216(WGD_o)
	C_LONGINT:C283(PDF_List_Box_i)
	
End if 

// Parameters
If (False:C215)
	C_LONGINT:C283(Show Splash; $1)
	C_LONGINT:C283(Client_Show; $1; $2)
	C_LONGINT:C283(PDF_ShowDocument; $1; $2; $4)
	C_TEXT:C284(PDF_ShowDocument; $3)
	C_POINTER:C301(UTIL_UnloadRecordReduceSelect; ${1})
	
	C_TEXT:C284(File_PathFromPathName; $0)
	C_TEXT:C284(File_PathFromPathName; $1)
	
	C_TEXT:C284(WGD_DescribeEntity; $0)
	
	C_TEXT:C284(WGD_TableNameForPDFList; $0)
	
	C_TEXT:C284(Splash_HelpOn; $1)
	
	C_LONGINT:C283(Vet_Show; $1; $2)
	
End if 
