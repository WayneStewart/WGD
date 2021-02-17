C_LONGINT:C283($Table_i; $View_i)
C_POINTER:C301($ListBox_ptr)
$ListBox_ptr:=->PDF_List_Box_i



Case of 
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY TEXT:C222($LBObjects_at; 0)
		
		$Table_i:=Table:C252(->[PDF:5])
		$View_i:=iLB_LastView($Table_i)
		
		iLB_Current_Table($ListBox_ptr; $Table_i)
		iLB_Current_View($ListBox_ptr; $View_i)
		
		QUERY:C277([PDF:5]; [PDF:5]Table_No:2=Table:C252(->[Dog:6]); *)
		QUERY:C277([PDF:5];  & ; [PDF:5]Record_ID:3=[Dog:6]ID:1)
		
		iLB_Load_Form($ListBox_ptr; $Table_i; $View_i)
		
		LISTBOX GET OBJECTS:C1302(PDF_List_Box_i; $LBObjects_at)
		
		OBJECT SET VISIBLE:C603(*; $LBObjects_at{1}; False:C215)
		OBJECT SET VISIBLE:C603(*; $LBObjects_at{4}; False:C215)
		
		
	Else 
		iLB_ObjectMethod($ListBox_ptr; Self:C308)
		
End case 

