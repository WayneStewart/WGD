// (OM) self->
C_POINTER:C301($Object_ptr; $PDFExternalArea_ptr)

//OBJECT Get pointer(Object named;"self->")->:=[PDF_Documents]Magnification

If (Self:C308->=0)
	Self:C308->:=0.1
End if 
$PDFExternalArea_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "PDF_ExternalArea_i")

PDFV Set Scale($PDFExternalArea_ptr->; Self:C308->/100)
[PDF:5]Magnification:6:=Self:C308->

$Object_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "PDF_Scale_r1")
$Object_ptr->:=[PDF:5]Magnification:6


