; a minimalistic version of set-mouse-speed with no error handling.
(import "user32.dll" "SystemParametersInfoA")
(SystemParametersInfoA 0x0071 0 (int (main-args 1)) 0)
(exit)
