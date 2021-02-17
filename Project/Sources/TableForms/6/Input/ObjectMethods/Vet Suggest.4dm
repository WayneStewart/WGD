// Object method for search box of products
C_LONGINT:C283($element_i; $FormEvent_i)
C_POINTER:C301($Obj_ptr)
C_TEXT:C284($Name_t)

$FormEvent_i:=Form event code:C388
Case of 
	: ($FormEvent_i=On Losing Focus:K2:8) | ($FormEvent_i=On Double Clicked:K2:5)
		OBJECT SET VISIBLE:C603(*; "Vet Suggest"; False:C215)
		
		$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Vet Suggest")
		
		If (Size of array:C274($Obj_ptr->)>0)
			
			// Get the highlighted row
			$element_i:=Find in array:C230($Obj_ptr->; True:C214)
			
			// Get the Vet Name
			$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Vet Listing")
			$Name_t:=$Obj_ptr->{$element_i}
			
			// Get the Vet Name
			$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Clinic Listing")
			$Name_t:=$Name_t+", "+$Obj_ptr->{$element_i}
			
			
			// Assign it to the form variable
			$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Vet")
			$Obj_ptr->:=$Name_t
			
			// Get the Vet ID
			$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Vet ID")
			// Assign it to the relating field
			[Dog:6]Vet_ID:13:=$Obj_ptr->{$element_i}
			
			If ($FormEvent_i=On Losing Focus:K2:8)  //  We don't do this after double click
				$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Vet Listing")
				$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Vet ID")
				$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Vet Suggest")
				
			End if 
			
			OBJECT SET ENABLED:C1123(*; "Fnd_IO_OKButton_i"; True:C214)
			
			GOTO OBJECT:C206(*; "Last Vacc")
			
		Else 
			Fnd_Dlg_CustomIcon("WGD Logo")
			Fnd_Wnd_Position(Fnd_Wnd_MacOSXSheet)
			Fnd_Dlg_Alert("You must choose a Vet from the list.")
			
			GOTO OBJECT:C206(*; "Vet")
			HIGHLIGHT TEXT:C210(*; "Vet"; 1; MAXTEXTLENBEFOREV11:K35:3)
			
		End if 
		
End case 