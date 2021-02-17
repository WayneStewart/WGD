// ----------------------------------------------------
// Object Method: Fnd_Tlbr_InvisibleButton1_i

// Created by Dave Batton on Nov 7, 2005
// ----------------------------------------------------
C_TEXT:C284($ButtonName_t)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		$ButtonName_t:=OBJECT Get name:C1087(Object current:K67:2)
		$ButtonName_t:=Replace string:C233($ButtonName_t; "Fnd_Tlbr_InvisibleButton"; "Fnd_Tlbr_PictureButton")
		Fnd_Host_Tlbr_ButtonClck(Get pointer:C304($ButtonName_t))
End case 