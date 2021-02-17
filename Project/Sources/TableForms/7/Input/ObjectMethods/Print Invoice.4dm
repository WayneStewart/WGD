QUERY:C277([Template:10]; [Template:10]Title:2="Invoice")

If (Records in selection:C76([Template:10])>0)
	PRINT SETTINGS:C106(Page setup dialog:K47:16)
	PRINT SETTINGS:C106(Print dialog:K47:17)
	
	WP USE PAGE SETUP:C1358([Template:10]Docco:3)
	
	RELATE ONE:C42([Training:7]Dog_ID:2)
	RELATE ONE:C42([Dog:6]Client_ID:2)
	
	WP PRINT:C1343([Template:10]Docco:3)
	
	
	UTIL_UnloadRecordReduceSelect(->[Template:10])
	
Else 
	Fnd_Dlg_Alert("You must create an invoice in the Templates table first.")
End if 