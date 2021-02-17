//%attributes = {"invisible":true,"shared":true}
C_POINTER:C301(${1})

C_LONGINT:C283($i)


If (False:C215)
	C_POINTER:C301(UTIL_UnloadRecordReduceSelect; ${1})
End if 

For ($i; 1; Count parameters:C259)
	UNLOAD RECORD:C212(${$i}->)
	REDUCE SELECTION:C351(${$i}->; 0)
	
End for 