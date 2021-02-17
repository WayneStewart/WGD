C_LONGINT:C283($Size_i)
C_POINTER:C301($Obj_ptr)
C_TEXT:C284($VetName_t; $sql_t)

ARRAY LONGINT:C221($Vet_ai; 0)
ARRAY TEXT:C222($Vet_at; 0)
ARRAY TEXT:C222($Clinic_at; 0)

$VetName_t:=Fnd_Text_Capitalize(Get edited text:C655)
$VetName_t:=Fnd_Text_StripSpaces($VetName_t; 1)  // 1 : leading spaces


Case of 
		
	: (Form event code:C388=On After Keystroke:K2:26)
		
		
		
		
		If ($VetName_t#"")
			
			
			//$sql_t:="%"+$VetName_t+"%"
			//Begin SQL
			//SELECT ClinicName, UsualVet, ID
			//FROM Vet
			//WHERE PrimaryContact LIKE :$sql_t
			
			//INTO :$Vet_at, :$Vet_ai
			
			//End SQL
			
			QUERY:C277([Vet:8]; [Vet:8]ClinicName:2="@"+$VetName_t+"@"; *)
			QUERY:C277([Vet:8];  | ; [Vet:8]UsualVet:5="@"+$VetName_t+"@")
			
			SELECTION TO ARRAY:C260([Vet:8]UsualVet:5; $Vet_at; \
				[Vet:8]ClinicName:2; $Clinic_at; \
				[Vet:8]ID:1; $Vet_ai)
			
			
			
			
			
			OBJECT SET VISIBLE:C603(*; "Vet Suggest"; True:C214)
			OBJECT SET ENABLED:C1123(Fnd_IO_OKButton_i; False:C215)
			
			
			$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Vet Listing")
			COPY ARRAY:C226($Vet_at; $Obj_ptr->)
			
			$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Clinic Listing")
			COPY ARRAY:C226($Clinic_at; $Obj_ptr->)
			
			$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Vet ID")
			COPY ARRAY:C226($Vet_ai; $Obj_ptr->)
			
			$Size_i:=Size of array:C274($Vet_ai)
			
			$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Vet Suggest")
			ARRAY BOOLEAN:C223($Obj_ptr->; $Size_i)
			
			
		End if 
		
		
	: (Form event code:C388=On Load:K2:1)
		If (Records in table:C83([Vet:8])=0)
			Self:C308->:="No vets in system"
			OBJECT SET ENTERABLE:C238(Self:C308->; False:C215)
			OBJECT SET FONT STYLE:C166(Self:C308->; Italic:K14:3)
			OBJECT SET HORIZONTAL ALIGNMENT:C706(Self:C308->; Align center:K42:3)
			
		Else 
			RELATE ONE:C42([Dog:6]Vet_ID:13)
			If (Records in selection:C76([Vet:8])=1)
				Self:C308->:=[Vet:8]UsualVet:5+", "+[Vet:8]ClinicName:2
			Else 
				Self:C308->:=""
			End if 
			
		End if 
		
		
End case 

