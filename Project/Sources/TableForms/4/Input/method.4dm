Fnd_IO_InputFormMethod


If (Form event code:C388=On Activate:K2:9)
	READ ONLY:C145([PDF:5])
	QUERY:C277([PDF:5]; [PDF:5]Table_No:2=Table:C252(->[Client:4]); *)
	QUERY:C277([PDF:5];  & ; [PDF:5]Record_ID:3=[Client:4]ID:1)
	
	C_BOOLEAN:C305(iLB_Refresh_View)
	iLB_Refresh_View:=True:C214
End if 
