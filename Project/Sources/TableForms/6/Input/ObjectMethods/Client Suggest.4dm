// Object method for search box of products
C_LONGINT:C283($element_i; $FormEvent_i)
C_POINTER:C301($Obj_ptr)
C_TEXT:C284($Name_t)

$FormEvent_i:=Form event code:C388
Case of 
	: ($FormEvent_i=On Losing Focus:K2:8) | ($FormEvent_i=On Double Clicked:K2:5)
		OBJECT SET VISIBLE:C603(*; "Client Suggest"; False:C215)
		
		$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Client Suggest")
		
		If (Size of array:C274($Obj_ptr->)>0)
			
			// Get the highlighted row
			$element_i:=Find in array:C230($Obj_ptr->; True:C214)
			
			// Get the Client Name
			$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Client Listing")
			$Name_t:=$Obj_ptr->{$element_i}
			
			// Assign it to the form variable
			$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Client")
			$Obj_ptr->:=$Name_t
			
			// Get the Client ID
			$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Client ID")
			// Assign it to the relating field
			[Dog:6]Client_ID:2:=$Obj_ptr->{$element_i}
			
			If ($FormEvent_i=On Losing Focus:K2:8)  //  We don't do this after double click
				
				$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Client Listing")
				
				$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Client ID")
				
				$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Client Suggest")
				
			End if 
			
			OBJECT SET ENABLED:C1123(*; "Fnd_IO_OKButton_i"; True:C214)
			
			GOTO OBJECT:C206(*; "Dog Name")
			
		Else 
			Fnd_Dlg_CustomIcon("WGD Logo")
			Fnd_Wnd_Position(Fnd_Wnd_MacOSXSheet)
			Fnd_Dlg_Alert("You must choose a client from the list.")
			
			GOTO OBJECT:C206(*; "Client")
			HIGHLIGHT TEXT:C210(*; "Client"; 1; MAXTEXTLENBEFOREV11:K35:3)
			
		End if 
		
End case 