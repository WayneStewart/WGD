Fnd_Gen_FormMethod

If (Form event code:C388=On Load:K2:1)
	OBJECT SET TITLE:C194(*; "Version Number"; "Version: "+Fnd_Gen_GetDatabaseInfo("DatabaseVersion"))
	
End if 