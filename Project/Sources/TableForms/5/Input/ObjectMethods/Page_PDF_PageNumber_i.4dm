// (OM) PDF_PageNumber_i
C_POINTER:C301($PageNumber_ptr; $PDF_Area_ptr; $PDF_PageCount_ptr)

$PageNumber_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Page_PDF_PageNumber_i")
$PDF_PageCount_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Page_PDF_PageCount_i")
$PDF_Area_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "PDF_ExternalArea_i")


Case of 
	: ($PageNumber_ptr-><0)
		$PageNumber_ptr->:=1
	: ($PageNumber_ptr->>$PDF_PageCount_ptr->)
		$PageNumber_ptr->:=$PDF_PageCount_ptr->
End case 



PDFV Set Current Page($PDF_Area_ptr->; $PageNumber_ptr->)