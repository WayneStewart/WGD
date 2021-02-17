Fnd_IO_InputFormMethod

If (Form event code:C388=On Load:K2:1)
	If ([Template:10]Title:2#"")
		SET WINDOW TITLE:C213([Template:10]Title:2)
		Fnd_Menu_Window_Add
	End if 
	
	If (Is new record:C668([Template:10]))
		If (OB Is defined:C1231(<>WGD_o; "TransferTemplate"))
			[Template:10]Docco:3:=OB Copy:C1225(<>WGD_o.TransferTemplate)
			OB REMOVE:C1226(<>WGD_o; "TransferTemplate")
		End if 
	End if 
End if 