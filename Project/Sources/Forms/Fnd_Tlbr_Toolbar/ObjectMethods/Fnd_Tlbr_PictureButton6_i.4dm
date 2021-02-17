// ----------------------------------------------------
// Object Method: Fnd_Tlbr_FormMethod.Fnd_Tlbr_PictureButton1_i
// ----------------------------------------------------

C_LONGINT:C283($buttonNumber_i)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		
		
		
		
		
	: (Form event code:C388=On Clicked:K2:4)
		Fnd_Host_Tlbr_ButtonClck(Get pointer:C304(OBJECT Get name:C1087(Object current:K67:2)))
End case 

