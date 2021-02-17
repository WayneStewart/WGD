// ----------------------------------------------------

// Trigger: Invoices


// Created by 4D, Inc. on May 2, 2003

// ----------------------------------------------------


C_LONGINT:C283($0; $error)

$error:=0

Case of 
	: (Trigger event:C369=On Saving New Record Event:K3:1)
		Fnd_SqNo_SetRecordID
End case 

$0:=$error