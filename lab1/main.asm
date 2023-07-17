;**************************************************************
;* This stationery serves as the framework for a              *
;* user application. For a more comprehensive program that    *
;* demonstrates the more advanced functionality of this       *
;* processor, please see the demonstration applications       *
;* located in the examples subdirectory of the                *
;* Freescale CodeWarrior for the HC12 Program directory       *
;**************************************************************
                     
;                  Multiplies two unsigned 8-bit numbers together
;******************************************************************************


; export symbols
              XDEF Entry, _Startup; Export 'Entry' Symbol
              ABSENTRY Entry      ; Absolute assembly, Application Entry point

; Include derivative-specific definitions
              INCLUDE "derivative.inc"
;******************************************************************************

;                             CODE SECTION
;******************************************************************************
;           variable/data section
                                               
                ORG $3000 ;                    (Original- Start of 'Working Storage' in RAM) 
                  
                
MULTIPLICAND    FCB 02    ; First Num          (Form Constant Byte)
MULTIPLIER      FCB 02    ; Second Num
PRODUCT         RMB  2    ; Sum of Multiplication     (Reserve Memory Byte)
            
;******************************************************************************

;                             Actual program
;******************************************************************************

                ORG $4000          ; (Original - where 'program text' starts)
                
 Entry:
 _Startup:
                LDAA MULTIPLICAND  ; Load First Num into Register A
                LDAB MULTIPLIER    ; Load Second Num into Register B
                MUL                ; Mutliply 8-bit num in register A with the 8-bit num in register B and store
                STD  PRODUCT       ; Store the product in register D into product
                SWI                ; Break to the montitor   (Software Interrupt Instruction)
                
;******************************************************************************

;                             Interrupt Vectors
;******************************************************************************
                ORG  $FFFF          ; The 'RESET' vector is located at addresses $FFFE & $FFFF 
                FDB  Entry          ; Reset Vector    (Form Double Byte)
