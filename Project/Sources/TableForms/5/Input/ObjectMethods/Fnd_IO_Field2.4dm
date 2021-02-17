Case of 
	: (Form event code:C388=On Load:K2:1)
		Case of 
			: (Length:C16([PDF:5]Description:4)>0)  // Don't change an existing document
				
			: (Length:C16(WGD_o.Description_t)>0)
				[PDF:5]Description:4:=WGD_o.Description_t
				
			Else 
				
				
		End case 
		
		
		
	: (Form event code:C388=On Data Change:K2:15)
		Self:C308->:=Fnd_Data_FormatText(Self:C308->)
		
End case 

