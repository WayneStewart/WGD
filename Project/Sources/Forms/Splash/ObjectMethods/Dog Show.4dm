


Case of 
	: (Form event code:C388=On Mouse Enter:K2:33)
		Splash_HelpOn("Click here to open the Dog table.")
		
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		Splash_HelpOff
		
	: (Form event code:C388=On Clicked:K2:4)
		Fnd_IO_DisplayTable(->[Dog:6])
		
		
		
End case 




