//%attributes = {"invisible":true}
// aaa_Test




$path_t:=Get 4D folder:C485(Current resources folder:K5:16)+"Example Data.xlsx"

$excel_i:=xlBookLoadFile($path_t)

$NumSheets_i:=xlBookSheetCount($excel_i)

$SheetNumber_i:=xlBookGetSheet($excel_i; 1)

$rows_i:=xlSheetGetLastRow($SheetNumber_i)
$columns_i:=xlSheetGetLastColumn($SheetNumber_i)

ARRAY TEXT:C222($Name_at; 0)
ARRAY TEXT:C222($number_at; 0)

$NameColumn_i:=1
$NumberColumn_i:=2

For ($CurrentRow_i; 2; $rows_i)
	$Name_t:=xlSheetGetCellText($SheetNumber_i; $CurrentRow_i; $NameColumn_i)
	$Number_t:=xlSheetGetCellText($SheetNumber_i; $CurrentRow_i; $NumberColumn_i)
	
	APPEND TO ARRAY:C911($Name_at; $Name_t)
	APPEND TO ARRAY:C911($number_at; $Number_t)
	
End for 


xlBookRelease($excel_i)

