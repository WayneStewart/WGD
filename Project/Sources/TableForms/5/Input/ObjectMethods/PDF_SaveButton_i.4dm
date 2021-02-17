C_BLOB:C604($PDF_x)
C_LONGINT:C283($Compressed_i; $CurrentSize_i; $ExpandedSize_i)
C_TIME:C306($DocumentReference_h)
C_TEXT:C284($Message_t; $Path_t)

$PDF_x:=[PDF:5]PDF_x:5
BLOB PROPERTIES:C536($PDF_x; $Compressed_i; $ExpandedSize_i; $CurrentSize_i)



If ($CurrentSize_i>0)
	If ($Compressed_i#Is not compressed:K22:11)
		EXPAND BLOB:C535($PDF_x)
	End if 
	$Message_t:=[PDF:5]Description:4
	
	If ($Message_t#"@.pdf")
		$Message_t:=$Message_t+".pdf"
	End if 
	
	$Path_t:=Select document:C905(System folder:C487(Desktop:K41:16)+$Message_t; "pdf"; "Save "+$Message_t; File name entry:K24:17)
	If (OK=1)
		BLOB TO DOCUMENT:C526(Document; $PDF_x)  // $blob contains document to record
	End if 
	
End if 


