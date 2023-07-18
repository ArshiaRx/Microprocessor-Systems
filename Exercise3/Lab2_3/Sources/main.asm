;**************************************************************
;* This stationery serves as the framework for a              *
;* user application. For a more comprehensive program that    *
;* demonstrates the more advanced functionality of this       *
;* processor, please see the demonstration applications       *
;* located in the examples subdirectory of the                *
;* Freescale CodeWarrior for the HC12 Program directory       *
;**************************************************************
; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols                              //Lab2 - Assignment 1
            XDEF Entry, _Startup
            ABSENTRY Entry
            
            
            ORG $4000
            
Entry:
_Startup:

;   Exercise 3
                BSET  DDRP, %11111111
                LDAA  #%10000000
    MainLoop:   STAA  PTP
                LDX   #$1FFF
    Delay:      DEX
                BNE   Delay
                EORA  #%10000000
                BRA   MainLoop
              
                        
            ORG $FFFF
            FDB Entry
            
;  END
;--------------------------------------------------                        