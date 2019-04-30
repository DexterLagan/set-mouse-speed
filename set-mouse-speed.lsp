
;;; purpose

; to set the mouse cursor speed

;Ported from C#
;use P/Invoke to the SystemParametersInfo api using 
;[DllImport("user32.dll", SetLastError = true)]
;[return: MarshalAs(UnmanagedType.Bool)]
;static extern bool SystemParametersInfo(SPI uiAction, uint uiParam, String pvParam, SPIF fWinIni);
;with the uiAction as (SPI_SETMOUSESPEED) = 0x0071

;;; defs

(define (set-cursor-speed n)
  "sets the cursor speed between 0 and 20 - 10 being default"
  (import "user32.dll" "SystemParametersInfoA")
  (letn ((SPI_SETMOUSESPEED 0x0071)
         (SPI_uiAction SPI_SETMOUSESPEED)
         (String_pvParam n)
         (SPIF_fWinIni 0))
     (SystemParametersInfoA SPI_uiAction uint_uiParam String_pvParam SPIF_fWinIni)))

;;; main

(define nSpeed (int (main-args 1)))

(if (nil? nSpeed)
    (begin (println "No speed specified.") (exit))
    (println "Setting mouse cursor speed to " (main-args 1) "."))

(define bResult (set-cursor-speed nSpeed))

(if bResult (println "Cursor speed set successfully!")
            (println "Error setting cursor speed."))

(exit)

;;; EOF
