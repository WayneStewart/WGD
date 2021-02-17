

Case of 
	: (Form event code:C388=On Mouse Enter:K2:33)
		Splash_HelpOn("Click here to start backing up, hold down option key and click to configure the backup.")
		
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		Splash_HelpOff
		
		
	: (Form event code:C388=On Clicked:K2:4)
		
		FLUSH CACHE:C297
		
		If (Macintosh option down:C545)
			OPEN SETTINGS WINDOW:C903("/Backup")
			
		Else 
			BACKUP:C887
			
		End if 
		
		
End case 




