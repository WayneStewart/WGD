C_POINTER:C301($Table_ptr)
C_TEXT:C284($Label_t)

If (Form event code:C388=On Load:K2:1)
	
	
	
	//If (OB Is defined(<>WGD_o;"New PDF"))
	
	
	
	
	//End if 
	
	
	
	If (OB Is defined:C1231(wgd_o; "TableNumber_i"))
	Else 
		WGD_o.RecordID_i:=[PDF:5]Record_ID:3
		WGD_o.Description_t:=[PDF:5]Description:4
		WGD_o.TableNumber_i:=[PDF:5]Table_No:2
		WGD_o.RecordNumber_i:=No current record:K29:2
	End if 
	
	If (wgd_o.TableNumber_i=0)
		
	Else 
		$Table_ptr:=Table:C252(wgd_o.TableNumber_i)
		$Label_t:=Table name:C256(wgd_o.TableNumber_i)+": "
	End if 
	
	Case of 
		: (wgd_o.TableNumber_i=0)
			$Label_t:="PDF — not connected to a client"
			
		: (WGD_o.RecordNumber_i=New record:K29:1)
			$Label_t:=$Label_t+"New Document"
			[PDF:5]Record_ID:3:=WGD_o.RecordID_i
			[PDF:5]Description:4:=WGD_o.Description_t
			[PDF:5]Table_No:2:=WGD_o.TableNumber_i
			
		: ($Table_ptr=(->[Client:4]))
			QUERY:C277([Client:4]; [Client:4]ID:1=[PDF:5]Record_ID:3)
			$Label_t:=$Label_t+[Client:4]PrimaryContact:2
			
	End case 
	
	Self:C308->:=$Label_t
	
	If (Is nil pointer:C315($Table_ptr))
	Else 
		UTIL_UnloadRecordReduceSelect($Table_ptr)
	End if 
	
End if 