// ----------------------------------------------------
// Database Method: On Exit
// ----------------------------------------------------

Fnd_Shell_OnExit

If (Fnd_Gen_ComponentAvailable("iLB@"))
	EXECUTE METHOD:C1007("iLB_ShutDown")
End if 

//iLB_ShutDown  