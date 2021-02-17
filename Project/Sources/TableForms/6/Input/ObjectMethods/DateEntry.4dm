//DateEntry sample code

Case of 
	: (Form event code:C388=On Data Change:K2:15)
		[Dog:6]DoB:4:=Self:C308->
		
	: (Form event code:C388=On Load:K2:1)
		
		
		// Init the var itself
		// this can be done anywhere else in your code
		//C_DATE(Self->)
		
		Self:C308->:=[Dog:6]DoB:4
		
		// let's customise the datepicker if needed;
		//  All examples below are inactivated (if false)
		C_BOOLEAN:C305($Customise_b)
		$Customise_b:=True:C214
		
		C_TEXT:C284($FormName)
		$FormName:=OBJECT Get name:C1087(Object current:K67:2)
		
		// the line below is useless until you use "DatePicker SET DEFAULT…" commands
		
		// DatePicker RESET DEFAULT VALUES 
		
		
		// the example below shows how to set days off of a week
		// just define a 7 rows boolean array and set days that are off to "true"
		// Tip : use 4D constants for code lisibility
		
		If ($Customise_b)
			ARRAY BOOLEAN:C223($_WeekDaysOff; 7)  //lets say wednesday and sunday are days off
			//$_WeekDaysOff{Wednesday}:=True
			$_WeekDaysOff{Sunday:K10:19}:=True:C214
			DatePicker SET DAYS OFF($FormName; 0; ->$_WeekDaysOff)  //0 means weekly days off
		End if 
		
		// the example below show how to define a min and a max enterable date
		// days before min and days after max will be dimmed
		// tip : use "Add to date" to avoid conflicts like 02/03 and 03/02 
		// to set the 3rd feb 2009 as min date use "Add to date(!00/00/00!;2009;02;03) rather than 02/03/09 or 03/02/09
		
		If (False:C215)
			DatePicker SET MIN DATE($FormName; Add to date:C393(Current date:C33; 0; 0; -15))  //min date is current date minus 15 days
			DatePicker SET MAX DATE($FormName; Add to date:C393(Current date:C33; 1; 0; 0))  //max date is current date plus 1 year
		End if 
		
		// The example below show how to define recurent days off (off every year at the same date)
		// example (for france) january 1st, may 1st, may 8th, july 14th, august 15th, november 1st, november 11th, december 25th
		// tip : use "Add to date" to avoid conflicts like 02/03 and 03/02 
		// 2000 can be used as any other year… not taken into account.
		
		If (False:C215)
			ARRAY DATE:C224($DaysOff_ad; 0)
			APPEND TO ARRAY:C911($DaysOff_ad; Add to date:C393(!00-00-00!; 2000; 1; 1))  //january 1rst
			APPEND TO ARRAY:C911($DaysOff_ad; Add to date:C393(!00-00-00!; 2000; 5; 1))
			APPEND TO ARRAY:C911($DaysOff_ad; Add to date:C393(!00-00-00!; 2000; 5; 8))
			APPEND TO ARRAY:C911($DaysOff_ad; Add to date:C393(!00-00-00!; 2000; 7; 14))
			APPEND TO ARRAY:C911($DaysOff_ad; Add to date:C393(!00-00-00!; 2000; 8; 15))
			APPEND TO ARRAY:C911($DaysOff_ad; Add to date:C393(!00-00-00!; 2000; 11; 1))
			APPEND TO ARRAY:C911($DaysOff_ad; Add to date:C393(!00-00-00!; 2000; 11; 11))
			APPEND TO ARRAY:C911($DaysOff_ad; Add to date:C393(!00-00-00!; 2000; 12; 25))  // december 25th
			
			DatePicker SET DAYS OFF($FormName; 1; ->$DaysOff_ad)  // 1 stands for every year
		End if 
		
		// The example below show how to define days off that are NOT recurent (NOT off every year at the same date)
		// Lets pretend June 27th is a particular in 2009
		// (in fact it is, it's my birthday, and shoud be recurent :-)
		
		If (False:C215)
			
			ARRAY DATE:C224($DaysOff_ad; 0)
			APPEND TO ARRAY:C911($DaysOff_ad; Add to date:C393(!00-00-00!; 2009; 6; 27))
			
			DatePicker SET DAYS OFF($FormName; 2; ->$DaysOff_ad)  // 2 stands for "only in 2009"
		End if 
		
		// The example below show how to define the first day of the week (default is monday)
		If ($Customise_b)
			DatePicker SET WEEK FIRST DAY($FormName; Sunday:K10:19)  // lets start the week on wednesday (why not)
		End if 
End case 
