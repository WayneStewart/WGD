//%attributes = {}
// Long name to path name Project Name
// Long name to path name ( String ) -> String
// Long name to path name ( Long file name ) -> Path name
C_TEXT:C284($0)
C_TEXT:C284($1)

C_LONGINT:C283($CurrentCharacter_i; $DelimiterPosition_i; $DirectorySymbolAsAsciiCode_i; $LastCharAsAscii_i; $LengthOfPathName_i; $Platform_i)
C_TEXT:C284($Path_t)


If (False:C215)
	C_TEXT:C284(File_PathFromPathName; $0)
	C_TEXT:C284(File_PathFromPathName; $1)
End if 

$Path_t:=$1


$DirectorySymbolAsAsciiCode_i:=Character code:C91(Folder separator:K24:12)


$LastCharAsAscii_i:=Character code:C91($Path_t[[Length:C16($Path_t)]])

$LengthOfPathName_i:=Length:C16($Path_t)
If ($LastCharAsAscii_i=$DirectorySymbolAsAsciiCode_i)
	$Path_t:=Substring:C12($Path_t; 1; Length:C16($Path_t)-1)
	$LengthOfPathName_i:=Length:C16($Path_t)
End if 


$DelimiterPosition_i:=0
For ($CurrentCharacter_i; $LengthOfPathName_i; 1; -1)
	If (Character code:C91($Path_t[[$CurrentCharacter_i]])=$DirectorySymbolAsAsciiCode_i)
		$DelimiterPosition_i:=$CurrentCharacter_i
		$CurrentCharacter_i:=0
	End if 
End for 
If ($DelimiterPosition_i>0)
	$0:=Substring:C12($Path_t; 1; $DelimiterPosition_i)
Else 
	$0:=$Path_t
End if 