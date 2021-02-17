C_LONGINT:C283($Selected_i)
C_POINTER:C301($Obj_ptr)
C_TEXT:C284($Path_t)

Fnd_IO_InputFormMethod

If (Form event code:C388=On Load:K2:1)
	
	If (Is new record:C668([Training:7]))
		
		[Training:7]Hourly_Rate:11:=Fnd_Pref_GetReal("Default Hourly Rate"; 50)
		[Training:7]Time_Spent:5:=Fnd_Pref_GetReal("Default Session Time"; 1)
		Training_CalcCharge
		
		//$Path_t:=Get 4D folder(Current resources folder)+"Templates"+Folder separator  //+"Training Notes.4wp"
		
		//If (Test path name($Path_t)#Is a folder)
		//CREATE FOLDER($Path_t)
		//End if 
		
		//$Path_t:=$Path_t+"Training Notes.4wp"
		
		//If (Test path name($Path_t)=Is a document)
		//[Training]Session_Notes:=WP Import document($Path_t)
		//End if 
		
		// Setup display on training session notes
		WP SET ATTRIBUTES:C1342([Training:7]Session_Notes:8; wk author:K81:81; "Sally Stewart")
		WP SET ATTRIBUTES:C1342([Training:7]Session_Notes:8; wk company:K81:82; "Watta Good Dog")
		WP SET ATTRIBUTES:C1342([Training:7]Session_Notes:8; wk subject:K81:80; "Training Notes - "+String:C10(Current date:C33; System date short:K1:1))
		
		
		
		SLCT_SetFields(->[Dog:6]; ->[Client:4]PrimaryContact:2; ->[Dog:6]Name:3)
		SLCT_RowHeight(19)
		SLCT_SetFormText("Choose "+Fnd_VS_TableName(->[Dog:6]); \
			"Please select the "+Fnd_VS_TableName(->[Dog:6])+" for this training session…")
		
		
		If (Fnd_Gen_Platform=Windows:K25:3)
			Fnd_Wnd_Position(Fnd_Wnd_CenterOnWindow)
			Fnd_Wnd_Type(Movable form dialog box:K39:8)
		Else 
			Fnd_Wnd_Type(Resizable sheet window:K34:16)
		End if 
		
		$Selected_i:=SLCT_Record(->[Dog:6]; "All")
		
		If ($Selected_i>-1)
			GOTO RECORD:C242([Dog:6]; $Selected_i)
			[Training:7]Dog_ID:2:=[Dog:6]ID:1
			
		Else 
			CANCEL:C270
		End if 
		
		
		
	End if 
	
	If ([Training:7]Dog_ID:2>0)
		$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Client and Dog")
		
		$Obj_ptr->:=[Dog:6]Name:3
		RELATE ONE:C42([Dog:6]Client_ID:2)
		$Obj_ptr->:=[Client:4]PrimaryContact:2+" - "+$Obj_ptr->
		
		If ([Training:7]Title:4="")
			SET WINDOW TITLE:C213($Obj_ptr->+" - Training - "+String:C10([Training:7]Training_Date:3; System date short:K1:1))
		Else 
			SET WINDOW TITLE:C213($Obj_ptr->+" - "+[Training:7]Title:4+" - "+String:C10([Training:7]Training_Date:3; System date short:K1:1))
		End if 
		
		If (Is new record:C668([Training:7]))
			WP SET ATTRIBUTES:C1342([Training:7]Session_Notes:8; wk title:K81:79; Get window title:C450)
		End if 
		
		Fnd_Menu_Window_Add
		
	End if 
	
	UTIL_UnloadRecordReduceSelect(->[Dog:6]; ->[Client:4])
	
	
	
End if 