//DateEntry sample code

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		If (Is new record:C668([Training:7]))
			[Training:7]Training_Date:3:=Current date:C33
		End if 
		
		// let's customise the datepicker if needed;
		//  All exemples below are inactivated (if false)
		C_BOOLEAN:C305($Customise)
		$Customise:=False:C215
		
		C_TEXT:C284($FormName)
		$FormName:=OBJECT Get name:C1087(Object current:K67:2)
		
		Self:C308->:=[Training:7]Training_Date:3
		
		
		// the line below is useless until you use "DatePicker SET DEFAULT…" commands
		
		// DatePicker RESET DEFAULT VALUES 
		
		
		// the example below shows how to set days off of a week
		// just define a 7 rows boolean array and set days that are off to "true"
		// Tip : use 4D constants for code lisibility
		
		
		
		
	: (Form event code:C388=On Data Change:K2:15)
		
		[Training:7]Training_Date:3:=Self:C308->
		
		//docSearch_ObjectMethod
		
		
		
End case 
