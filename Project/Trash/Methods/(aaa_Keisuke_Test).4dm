//%attributes = {"invisible":true}
// aaa_Test


$path_t:=Get 4D folder:C485(Current resources folder:K5:16)+"Example Data.xls"

$excel_i:=XLS Load($path_t)

$Sheets_i:=XLS Get total sheets($excel_i)

$rows_i:=XLS Get total rows($excel_i; 1)
$columns_i:=XLS Get total columns($excel_i; 1)

ARRAY TEXT:C222($Name_at; 0)
ARRAY TEXT:C222($number_at; 0)

$SheetNumber_i:=1
$NameColumn_i:=1
$NumberColumn_i:=2

For ($CurrentRow_i; 2; $rows_i)
	//$Name_t:=xlSheetGetCellText ($SheetNumber_i;$CurrentRow_i;$NameColumn_i)
	$Name_t:=XLS Get text value($excel_i; $SheetNumber_i; $CurrentRow_i; $NameColumn_i)
	//$Number_t:=xlSheetGetCellText ($SheetNumber_i;$CurrentRow_i;$NumberColumn_i)
	$Number_t:=XLS Get text value($excel_i; $SheetNumber_i; $CurrentRow_i; $NumberColumn_i)
	
	APPEND TO ARRAY:C911($Name_at; $Name_t)
	APPEND TO ARRAY:C911($number_at; $Number_t)
	
End for 




XLS CLOSE($excel_i)

