// ----------------------------------------------------
// Object Method: ◊Pref_NavPaletteCheckbox_i
// ----------------------------------------------------

Case of 
	: (Form event code:C388=On Load:K2:1)
		Self:C308->:=Num:C11(Fnd_Pref_GetBoolean("Fnd_Nav: Open at Startup"; False:C215))
		
		
	: (Form event code:C388=On Clicked:K2:4)
		Fnd_Pref_SetBoolean("Fnd_Nav: Open at Startup"; (Self:C308->=1))
End case 
