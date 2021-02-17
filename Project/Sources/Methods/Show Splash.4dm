//%attributes = {"invisible":true,"shared":true}
// Show Splash
// Created by Wayne Stewart (2017-06-13T14:00:00Z)
//  Method is an autostart type
//     wayne@4dsupport.guru
// ----------------------------------------------------

C_LONGINT:C283($1; $ProcessID_i; $StackSize_i; $WindowID_i)
C_TEXT:C284($Dialog_t; $Title_t)
C_POINTER:C301($Nil_ptr)

If (False:C215)  //  Copy this to your Compiler Method!
	C_LONGINT:C283(Show Splash; $1)
End if 

// ----------------------------------------------------

WGD_Init

$StackSize_i:=0
$Dialog_t:="Splash"
$Title_t:="Watta Good Dog"

If (Count parameters:C259=1)
	Fnd_Gen_MenuBar
	Fnd_Wnd_SendCloseRequests
	
	Fnd_Wnd_UseSavedPosition($Title_t)
	Fnd_Wnd_Position(Fnd_Wnd_StackedOnWindow)
	Fnd_Wnd_Title($Title_t)
	Fnd_Wnd_Type(Plain fixed size window:K34:6)
	Fnd_Wnd_CloseBox(True:C214)
	
	
	$WindowID_i:=Fnd_Wnd_OpenFormWindow($Nil_ptr; $Dialog_t)
	Fnd_Menu_Window_Add($Title_t)
	DIALOG:C40($Dialog_t)
	Fnd_Menu_Window_Remove
	Fnd_Wnd_SavePosition($Title_t)
	
	CLOSE WINDOW:C154($WindowID_i)
	
Else 
	// This version allows for any number of processes
	// $ProcessID_i:=New Process(Current method name;$StackSize_i;Current method name;0)
	
	// On the other hand, this version allows for one unique process
	$ProcessID_i:=New process:C317(Current method name:C684; $StackSize_i; Current method name:C684; 0; *)
	
	RESUME PROCESS:C320($ProcessID_i)
	SHOW PROCESS:C325($ProcessID_i)
	BRING TO FRONT:C326($ProcessID_i)
End if 
