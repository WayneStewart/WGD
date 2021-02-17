//%attributes = {"shared":true}
// ----------------------------------------------------
// Project Method: Fnd_Hook_Shell_NavPalette

// This hook is called each time the Navigation Palette command is
//   selected from the Tools menu.

// Method Type: Public

// Parameters: None

// Returns: Nothing
// ----------------------------------------------------
WGD_Init
// Specify the buttons to display on the Navigation Palette.
// Or do nothing, and Foundation will display the visible tables.

Fnd_Nav_AddButtonTable(->[Client:4]; ""; Foreground color:K23:1; 0x00C6D4FC)
Fnd_Nav_AddButtonTable(->[Dog:6]; ""; Foreground color:K23:1; 0x00C6D4FC)
Fnd_Nav_AddButtonTable(->[Training:7]; ""; Foreground color:K23:1; 0x00C6D4FC)
Fnd_Nav_AddButtonTable(->[PDF:5]; ""; Foreground color:K23:1; 0x00E2FFDF)
Fnd_Nav_AddButtonTable(->[Template:10]; ""; Foreground color:K23:1; 0x00E2FFDF)

Fnd_Nav_AddButtonMethod("Show Splash"; "Control Centre"; Foreground color:K23:1; 0x00FCC6D4)

Fnd_Nav_Display
