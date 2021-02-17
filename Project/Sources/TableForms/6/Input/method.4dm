C_LONGINT:C283($CharacterCode_i)
C_TEXT:C284($Name_t)
C_POINTER:C301($Object_ptr)


Fnd_IO_InputFormMethod

$Name_t:=OBJECT Get name:C1087(Object with focus:K67:3)
$CharacterCode_i:=Character code:C91(Keystroke:C390)

Case of 
	: (Form event code:C388=On After Keystroke:K2:26)
		
		Case of 
			: ($CharacterCode_i=Down arrow key:K12:19)
				
				Case of 
					: ($Name_t="Client")
						GOTO OBJECT:C206(*; "Client Suggest")
						LISTBOX SELECT ROW:C912(*; "Client Suggest"; 1)
						
					: ($Name_t="Vet")
						GOTO OBJECT:C206(*; "Vet Suggest")
						LISTBOX SELECT ROW:C912(*; "Vet Suggest"; 1)
						
						
						
				End case 
		End case 
		
	: (Form event code:C388=On Before Keystroke:K2:6)
		If ($CharacterCode_i=Carriage return:K15:38)
			
			Case of 
				: ($Name_t="Client")
					GOTO OBJECT:C206(*; "Dog Name")
					FILTER KEYSTROKE:C389("")
					
				: ($Name_t="Vet")
					GOTO OBJECT:C206(*; "Last Vacc")
					FILTER KEYSTROKE:C389("")
					
					
			End case 
		End if 
		
	: (Form event code:C388=On Activate:K2:9)
		$Object_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Client")
		
		RELATE ONE:C42([Dog:6]Client_ID:2)
		If (Records in selection:C76([Client:4])=1)
			$Object_ptr->:=[Client:4]PrimaryContact:2
		Else 
			$Object_ptr->:=""
		End if 
		
		$Object_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Vet")
		
		If (Records in table:C83([Vet:8])=0)
			$Object_ptr->:="No vets in system"
			OBJECT SET ENTERABLE:C238(Self:C308->; False:C215)
			OBJECT SET FONT STYLE:C166(Self:C308->; Italic:K14:3)
			OBJECT SET HORIZONTAL ALIGNMENT:C706(Self:C308->; Align center:K42:3)
			
		Else 
			RELATE ONE:C42([Dog:6]Vet_ID:13)
			If (Records in selection:C76([Vet:8])=1)
				$Object_ptr->:=[Vet:8]UsualVet:5+", "+[Vet:8]ClinicName:2
			Else 
				$Object_ptr->:=""
			End if 
			
		End if 
		
		READ ONLY:C145([PDF:5])
		QUERY:C277([PDF:5]; [PDF:5]Table_No:2=Table:C252(->[Dog:6]); *)
		QUERY:C277([PDF:5];  & ; [PDF:5]Record_ID:3=[Dog:6]ID:1)
		
		C_BOOLEAN:C305(iLB_Refresh_View)
		iLB_Refresh_View:=True:C214
		
		
		
		
End case 