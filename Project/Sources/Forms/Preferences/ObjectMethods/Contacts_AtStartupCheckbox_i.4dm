// ----------------------------------------------------

// Object Method: <>Contacts_AtStartupCheckbox_i

// ----------------------------------------------------


Case of 
	: (Form event code:C388=On Load:K2:1)
		Self:C308->:=Num:C11(Fnd_Pref_GetBoolean("Display Control Centre at Startup"; True:C214))
		
	: (Form event code:C388=On Clicked:K2:4)
		Fnd_Pref_SetBoolean("Display Control Centre at Startup"; (Self:C308->=1))
End case 
