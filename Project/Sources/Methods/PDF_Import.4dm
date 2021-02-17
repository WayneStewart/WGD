//%attributes = {}
// ----------------------------------------------------
// Project Method: PDF_Import

// Description

// Access: Shared

// Parameters:
//   $1 : Type : Description
//   $x : Type : Description (optional)

// Created by Wayne Stewart (2017-07-31T14:00:00Z)
//     wayne@4dsupport.guru
// ----------------------------------------------------

C_LONGINT:C283($Position_i; $Result_i)
C_POINTER:C301($Object_ptr; $Object2_ptr; $PDFArea_ptr)
C_TEXT:C284($Password_t; $Path_t)


$Path_t:=Fnd_Pref_GetText("PDF Document Path"; $Path_t; Fnd_Pref_Local)
$Path_t:=Select document:C905($Path_t; "*"; "Please select a pdf document:"; Use sheet window:K24:11)

If (OK=1)
	Fnd_Pref_SetText("PDF Document Path"; File_PathFromPathName(Document); Fnd_Pref_Local)
	DOCUMENT TO BLOB:C525(document; [PDF:5]PDF_x:5)
	
	// Load the PDF document
	$PDFArea_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "PDF_ExternalArea_i")
	
	$Result_i:=PDFV Open Document($PDFArea_ptr->; Document)
	If ($Result_i=0)  // Probably not a PDF document
		SET BLOB SIZE:C606([PDF:5]PDF_x:5; 0)
		Fnd_Wnd_Position(Fnd_Wnd_MacOSXSheet)
		Fnd_Dlg_CustomIcon("WGD Logo")
		Fnd_Dlg_Alert("The document could not be opened.")
	End if 
	
	// If the PDF is password protected, ask for the password to unlock it
	$Result_i:=PDFV Is Encrypted($PDFArea_ptr->)
	If ($Result_i=1)
		Fnd_Wnd_Position(Fnd_Wnd_MacOSXSheet)
		Fnd_Dlg_CustomIcon("WGD Logo")
		$Password_t:=Fnd_Dlg_Request("This document is protected.\rPlease enter a password:")
		$Result_i:=PDFV Unlock($PDFArea_ptr->; $Password_t)
	End if 
	
	// Initialise some variables
	
	//PDF_PageNumber_i:=PDFV Get Current Page ($PDFArea_ptr->)
	//PDF_PageCount_i:=PDFV Count Pages ($PDFArea_ptr->)
	
	$Object_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Page_PDF_PageNumber_i")
	$Object_ptr->:=PDFV Get Current Page($PDFArea_ptr->)
	
	$Object_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Page_PDF_PageCount_i")
	$Object_ptr->:=PDFV Count Pages($PDFArea_ptr->)
	
	
	
	$Object_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "PDF_Scale_r")
	$Object_ptr->:=PDFV Get Scale($PDFArea_ptr->)*100
	
	$Object2_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "PDF_Scale_r1")
	$Object2_ptr->:=$Object_ptr->
	
	
	
	
	
End if 