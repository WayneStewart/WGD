//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// Project Method: Fnd_Host_GetIntegerValue (variable name) --> Longint

// Allows a component to get the value of a host long integer variable.

// Access: Shared

// Parameters: 
//   $1 : Text : The variable name

// Returns:
//   $0 : Longint : The variable's value

// This method was automatically generated by Foundation on Sep 30, 2009.
// ----------------------------------------------------

C_LONGINT:C283($0; Fnd_Host_IntegerValue_t)
C_TEXT:C284($1; $variableName_t)

$variableName_t:=$1

EXECUTE FORMULA:C63("Fnd_Host_IntegerValue_t:="+$variableName_t)

$0:=Fnd_Host_IntegerValue_t