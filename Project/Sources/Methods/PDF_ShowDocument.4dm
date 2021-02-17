//%attributes = {"invisible":true,"shared":true}
// Client_ShowDocument
// Created by Wayne Stewart (2017-07-31T14:00:00Z)
//  Method is an autostart type
//     wayne@4dsupport.guru
// ----------------------------------------------------


// ----------------------------------------------------


C_LONGINT:C283($1)
C_LONGINT:C283($2)
C_TEXT:C284($3)
C_LONGINT:C283($4)

C_LONGINT:C283($ProcessID_i; $RecordID_i; $StackSize_i; $TableNumber_i; $WindowID_i)
C_TEXT:C284($Description_t; $ProcessName_t)

WGD_Init


If (False:C215)
	C_LONGINT:C283(PDF_ShowDocument; $1)
	C_LONGINT:C283(PDF_ShowDocument; $2)
	C_TEXT:C284(PDF_ShowDocument; $3)
	C_LONGINT:C283(PDF_ShowDocument; $4)
End if 


$StackSize_i:=0

$TableNumber_i:=$1
$RecordID_i:=$2
$Description_t:=$3

If (Count parameters:C259=4)
	
	
	WGD_o.RecordID_i:=$RecordID_i
	WGD_o.Description_t:=$Description_t
	WGD_o.TableNumber_i:=$TableNumber_i
	
	READ ONLY:C145(*)
	READ WRITE:C146([PDF:5])
	QUERY:C277([PDF:5]; [PDF:5]Table_No:2=$TableNumber_i; *)
	QUERY:C277([PDF:5];  & ; [PDF:5]Record_ID:3=$RecordID_i; *)
	QUERY:C277([PDF:5];  & ; [PDF:5]Description:4=$Description_t)
	
	WGD_o.RecordNumber_i:=Record number:C243([PDF:5])
	If (WGD_o.RecordNumber_i=No current record:K29:2)
		WGD_o.RecordNumber_i:=New record:K29:1
		WGD_o.Description_t:=""
	End if 
	
	Fnd_Gen_CurrentTable(->[PDF:5])
	Fnd_IO_DisplayRecord3(WGD_o.RecordNumber_i)
	
	
Else 
	// This version allows for any number of processes
	// $ProcessID_i:=New Process(Current method name;$StackSize_i;Current method name;0)
	
	$ProcessName_t:="PDF: "+Table name:C256($TableNumber_i)+" ("+String:C10($RecordID_i)+") "+$Description_t
	If (Length:C16($ProcessName_t)>31)
		$ProcessName_t:=Substring:C12($ProcessName_t; 1; 30)+"…"
	End if 
	
	// On the other hand, this version allows for one unique process
	$ProcessID_i:=New process:C317(Current method name:C684; $StackSize_i; $ProcessName_t; \
		$TableNumber_i; $RecordID_i; $Description_t; 0; *)
	
	RESUME PROCESS:C320($ProcessID_i)
	SHOW PROCESS:C325($ProcessID_i)
	BRING TO FRONT:C326($ProcessID_i)
End if 

