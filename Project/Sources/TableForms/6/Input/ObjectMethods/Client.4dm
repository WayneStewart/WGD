C_LONGINT:C283($Size_i)
C_POINTER:C301($Obj_ptr)
C_TEXT:C284($ClientName_t; $sql_t)

ARRAY LONGINT:C221($Client_ai; 0)
ARRAY TEXT:C222($Client_at; 0)

$ClientName_t:=Fnd_Text_Capitalize(Get edited text:C655)
$ClientName_t:=Fnd_Text_StripSpaces($ClientName_t; 1)  // 1 : leading spaces


Case of 
	: (Form event code:C388=On After Keystroke:K2:26)
		
		
		
		
		If ($ClientName_t#"")
			
			$sql_t:="%"+$ClientName_t+"%"
			Begin SQL
				SELECT PrimaryContact, ID
				FROM Client
				WHERE PrimaryContact LIKE :$sql_t
				
				INTO :$Client_at, :$Client_ai
				
			End SQL
			
			OBJECT SET VISIBLE:C603(*; "Client Suggest"; True:C214)
			OBJECT SET ENABLED:C1123(Fnd_IO_OKButton_i; False:C215)
			
			
			$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Client Listing")
			COPY ARRAY:C226($Client_at; $Obj_ptr->)
			
			$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Client ID")
			COPY ARRAY:C226($Client_ai; $Obj_ptr->)
			
			$Size_i:=Size of array:C274($Client_ai)
			
			$Obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Client Suggest")
			ARRAY BOOLEAN:C223($Obj_ptr->; $Size_i)
			
			
		End if 
		
		
	: (Form event code:C388=On Load:K2:1)
		RELATE ONE:C42([Dog:6]Client_ID:2)
		If (Records in selection:C76([Client:4])=1)
			Self:C308->:=[Client:4]PrimaryContact:2
		Else 
			Self:C308->:=""
		End if 
		
		
End case 

