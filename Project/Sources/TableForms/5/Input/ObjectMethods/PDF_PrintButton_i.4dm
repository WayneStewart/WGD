// ------------------------------------------------------------
// Object Method: PDF_PrintButton_i
//   Wayne Stewart waynestewart@mac.com
//   Sep 28, 2006
C_LONGINT:C283($DisplayDialogs_i)
// ------------------------------------------------------------

// The important thing to remember is that you must call 
// PAGE SETUP to re-initialise the settings for the print 
// job. There are also commands like
//  "PDFV New Offscreen Area" and
//  "PDFV Delete Offscreen Area"
// in case you want to print a document without showing a user interface.

_O_PAGE SETUP:C299("A4_Portrait")
SET PRINT OPTION:C733(_o_Hide printing progress option:K47:12; 1)
SET PRINT OPTION:C733(Destination option:K47:7; 1)
C_POINTER:C301($PDFExternalArea_ptr)
$PDFExternalArea_ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "PDF_ExternalArea_i")

If (OK=1)
	$DisplayDialogs_i:=1  // 1 = on, 0 = off
	PDFV Print Document($PDFExternalArea_ptr->; $DisplayDialogs_i)
End if 