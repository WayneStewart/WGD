C_LONGINT:C283($Compressed_i; $CurrentSize_i; $ExpandedSize_i; $Result_i)
C_POINTER:C301($Object_ptr; $PDFExternalArea_ptr)
C_TEXT:C284($PDF_Document_t)

Fnd_IO_InputFormMethod

If (Form event code:C388=On Load:K2:1)
	$Object_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "PDF_Scale_r")
	$Object_ptr->:=[PDF:5]Magnification:6
	$Object_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "PDF_Scale_r1")
	$Object_ptr->:=[PDF:5]Magnification:6
	
	
	BLOB PROPERTIES:C536([PDF:5]PDF_x:5; $Compressed_i; $ExpandedSize_i; $CurrentSize_i)
	If ($CurrentSize_i>0)
		If ($Compressed_i#Is not compressed:K22:11)
			EXPAND BLOB:C535([PDF:5]PDF_x:5)
		End if 
	End if 
	
	$PDFExternalArea_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "PDF_ExternalArea_i")
	
	If ($CurrentSize_i>0)  // There is a pdf stored
		If (Fnd_Gen_Platform=Windows:K25:3)
			OBJECT SET VISIBLE:C603(*; "Page@"; False:C215)
			$PDF_Document_t:=Temporary folder:C486+"WGD pdf Document"+String:C10([PDF:5]ID:1)+".pdf"
			BLOB TO DOCUMENT:C526($PDF_Document_t; [PDF:5]PDF_x:5)
			$Result_i:=PDFV Open Document($PDFExternalArea_ptr->; $PDF_Document_t)
		Else 
			$Result_i:=PDFV Open Blob($PDFExternalArea_ptr->; [PDF:5]PDF_x:5)
		End if 
		
		PDFV Set Scale($PDFExternalArea_ptr->; [PDF:5]Magnification:6/100)
		
		$Object_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Page_PDF_PageNumber_i")
		$Object_ptr->:=PDFV Get Current Page($PDFExternalArea_ptr->)
		
		$Object_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Page_PDF_PageCount_i")
		$Object_ptr->:=PDFV Count Pages($PDFExternalArea_ptr->)
		
		
	Else 
		$Object_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Page_PDF_PageNumber_i")
		$Object_ptr->:=0
		
		$Object_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Page_PDF_PageCount_i")
		$Object_ptr->:=0
		
		
		
	End if 
	
	
	
	PDFV Set Scrollbars Visible($PDFExternalArea_ptr->; 1; 1)
	
End if 