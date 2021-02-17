// ----------------------------------------------------
// Object Method: ◊Pref_NavPaletteCheckbox_i
// ----------------------------------------------------

Case of 
	: (Form event code:C388=On Load:K2:1)
		Self:C308->:=Fnd_Pref_GetReal("Tax Rate"; 0)
		
		
	: (Form event code:C388=On Data Change:K2:15)
		Fnd_Pref_SetReal("Tax Rate"; Self:C308->)
End case 
