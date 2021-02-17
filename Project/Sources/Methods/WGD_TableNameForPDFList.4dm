//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($0)

If (False:C215)
	C_TEXT:C284(WGD_TableNameForPDFList; $0)
End if 


If (Is table number valid:C999([PDF:5]Table_No:2))
	$0:=Fnd_VS_TableName(Table:C252([PDF:5]Table_No:2))
Else 
	$0:=""
End if 