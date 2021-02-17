// ----------------------------------------------------
// Object Method: Fnd_Tlbr_FormMethod.Fnd_Tlbr_PictureButton1_i
// ----------------------------------------------------

C_LONGINT:C283($buttonNumber_i)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY POINTER:C280($pictures_aptr; 20)
		For ($buttonNumber_i; 1; 20)
			$pictures_aptr{$buttonNumber_i}:=Get pointer:C304("Fnd_Tlbr_ButtonImage"+String:C10($buttonNumber_i)+"_pic")
		End for 
		
		ARRAY POINTER:C280($buttons_aptr; 20)
		For ($buttonNumber_i; 1; 20)
			$buttons_aptr{$buttonNumber_i}:=OBJECT Get pointer:C1124(Object named:K67:5; "Fnd_Tlbr_PictureButton"+String:C10($buttonNumber_i)+"_i")
			//Get pointer("Fnd_Tlbr_PictureButton"+String($buttonNumber_i)+"_i")
		End for 
		
		Fnd_Tlbr_SetHostVars(->$pictures_aptr; ->$buttons_aptr; ->Fnd_Tlbr_Info_t)
		
		C_LONGINT:C283($Button_i)
		C_TEXT:C284($Columns_t; $Rows_t; $PictureName_t; $Flags_t; $displayFormat_t; $Name_t)
		
		
		For ($Button_i; 1; 20)
			$Name_t:="Fnd_Tlbr_PictureButton"+String:C10($Button_i)+"_i"
			
			$Columns_t:="1"
			$Rows_t:="4"
			$PictureName_t:="Fnd_Tlbr_ButtonImage"+String:C10($Button_i)+"_pic"
			
			$Flags_t:=String:C10(16+32+128)
			$displayFormat_t:=$Columns_t+";"+$Rows_t+";"+$PictureName_t+";"+$Flags_t
			
			OBJECT SET FORMAT:C236(*; $Name_t; $displayFormat_t)
			
		End for 
		
		
		
	: (Form event code:C388=On Clicked:K2:4)
		
		Fnd_Host_Tlbr_ButtonClck(Get pointer:C304(OBJECT Get name:C1087(Object current:K67:2)))
End case 