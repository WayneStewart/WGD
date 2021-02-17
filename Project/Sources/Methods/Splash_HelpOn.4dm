//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1)


If (False:C215)
	C_TEXT:C284(Splash_HelpOn; $1)
End if 

OBJECT SET VISIBLE:C603(*; "Help"; True:C214)
OBJECT SET TITLE:C194(*; "Help"; $1)

