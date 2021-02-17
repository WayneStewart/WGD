// ----------------------------------------------------

// Trigger: Line Items


// Created by 4D, Inc. on May 2, 2003

// ----------------------------------------------------


C_LONGINT:C283($0; $error)

$error:=0

Case of 
	: (Trigger event:C369=On Saving New Record Event:K3:1) | (Trigger event:C369=On Saving Existing Record Event:K3:2)
		Fnd_SqNo_SetRecordID
		If ([Training:7]Dog_ID:2=0)  // The line item must be linked to an invoice.

			$error:=32010  // See the docs for error number info.

		End if 
End case 

$0:=$error