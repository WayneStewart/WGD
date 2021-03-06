//%attributes = {}
// Client_Show
// Created by Wayne Stewart (2017-07-27T14:00:00Z)
//  Method is an autostart type
//     wayne@4dsupport.guru
// ----------------------------------------------------

C_LONGINT:C283($1; $2; $ProcessID_i; $StackSize_i; $WindowID_i; $RecordNumber_i)

If (False:C215)  //  Copy this to your Compiler Method!
	C_LONGINT:C283(Client_Show; $1; $2)
End if 

// ----------------------------------------------------

WGD_Init

$StackSize_i:=0

If (Count parameters:C259=2)
	
	READ ONLY:C145(*)
	QUERY:C277([Client:4]; [Client:4]ID:1=$1)
	
	If (Records in selection:C76([Client:4])=1)
		Fnd_IO_DisplayRecord(->[Client:4]; Record number:C243([Client:4]))
		UTIL_UnloadRecordReduceSelect(->[Client:4])
	Else 
		Fnd_Dlg_Alert("The Client record cannot be found")
	End if 
	
Else 
	// This version allows for any number of processes
	// $ProcessID_i:=New Process(Current method name;$StackSize_i;Current method name;0)
	
	// On the other hand, this version allows for one unique process
	$ProcessID_i:=New process:C317(Current method name:C684; $StackSize_i; Current method name:C684; $1; 0; *)
	
	RESUME PROCESS:C320($ProcessID_i)
	SHOW PROCESS:C325($ProcessID_i)
	BRING TO FRONT:C326($ProcessID_i)
End if 
