// (OM) vl_PrevButton
C_POINTER:C301($PDFExternalArea_ptr; $PageNumber_ptr)

$PDFExternalArea_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "PDF_ExternalArea_i")
$PageNumber_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Page_PDF_PageNumber_i")

If ($PageNumber_ptr->>1)
	$PageNumber_ptr->:=$PageNumber_ptr->-1
	PDFV Set Current Page($PDFExternalArea_ptr->; $PageNumber_ptr->)
End if 