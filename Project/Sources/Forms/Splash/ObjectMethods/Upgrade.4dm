

Case of 
	: (Form event code:C388=On Mouse Enter:K2:33)
		Splash_HelpOn("Click here to see if an upgrade is available.")
		
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		Splash_HelpOff
		
		
	: (Form event code:C388=On Clicked:K2:4)
		Alert2("No  upgrade available")
		//FLUSH CACHE
		
		//If (Macintosh option down)
		//OPEN SETTINGS WINDOW("/Backup")
		
		//Else 
		//BACKUP
		
		//End if 
		
		
End case 




