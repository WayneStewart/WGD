//%attributes = {"shared":true}
// ----------------------------------------------------
// Project Method: Fnd_Hook_IO_InputFormButton (button) --> Boolean

// This hook is called when a button on the inherited Fnd_IO_InputForm
//   is clicked.

// Method Type: Public

// Parameters:
//   $1 : Text : The button that was clicked:
//      "save"
//      "cancel"
//      "first"
//      "previous"
//      "next"
//      "last"

// Returns:
//   $0 : Boolean : Allow Foundation to handle the request?
// ----------------------------------------------------

// Call Fnd_Gen_CurrentTable to determine the current table.
// Return False to prevent the default action.

C_BOOLEAN:C305($0)
C_TEXT:C284($1)

C_LONGINT:C283($Compressed_i; $CurrentSize_i; $ExpandedSize_i)
C_POINTER:C301($Table_ptr)
C_TEXT:C284($Button_t)


If (False:C215)
	C_BOOLEAN:C305(Fnd_Hook_IO_InputFormButton; $0)
	C_TEXT:C284(Fnd_Hook_IO_InputFormButton; $1)
End if 


$Button_t:=$1

$Table_ptr:=Fnd_Gen_CurrentTable

Case of 
	: ($Table_ptr=(->[PDF:5]))
		If ($Button_t#"cancel")
			
			BLOB PROPERTIES:C536([PDF:5]PDF_x:5; $Compressed_i; $ExpandedSize_i; $CurrentSize_i)
			If ($CurrentSize_i>0)
				If ($Compressed_i=Is not compressed:K22:11)
					COMPRESS BLOB:C534([PDF:5]PDF_x:5; Compact compression mode:K22:12)
				End if 
			End if 
			
			
		End if 
		
End case 





$0:=True:C214