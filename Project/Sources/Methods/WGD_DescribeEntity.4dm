//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($0)

C_LONGINT:C283($RecordID_i)
C_TEXT:C284($Description_t; $DogName_t)


If (False:C215)
	C_TEXT:C284(WGD_DescribeEntity; $0)
End if 

$RecordID_i:=[PDF:5]Record_ID:3

Case of 
	: ([PDF:5]Table_No:2=Table:C252(->[Client:4]))
		Begin SQL
			select PrimaryContact
			from Client
			Where ID = :$RecordID_i
			into :$Description_t
		End SQL
		$0:=$Description_t
		
	: ([PDF:5]Table_No:2=Table:C252(->[Dog:6]))
		Begin SQL
			select PrimaryContact, Name
			from Client, Dog
			Where Dog.ID = :$RecordID_i and Client.ID = Dog.Client_ID
			into :$Description_t, :$DogName_t
		End SQL
		$0:=$Description_t+" "+$DogName_t
		
End case 



