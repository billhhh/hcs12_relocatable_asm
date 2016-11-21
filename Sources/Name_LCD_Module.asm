;Author: Bill Wang
;Date: 11/20/2016/
;Module file

        XDEF DELAY
        XDEF DISPLAY
        XREF DATWRT4
        
R1      EQU     $1001
R2      EQU     $1002
R3      EQU     $1003

NAME DC.B "HU WANG BILL",0

DELAY:
        PSHA		;Save Reg A on Stack
        LDAA    #1		  
        STAA    R3		
;-- 1 msec delay. The Serial Monitor works at speed of 48MHz with XTAL=8MHz on Dragon12+ board
;Freq. for Instruction Clock Cycle is 24MHz (1/2 of 48Mhz). 
;(1/24MHz) x 10 Clk x240x100=1 msec. Overheads are excluded in this calculation.         
L3      LDAA    #100
        STAA    R2
L2      LDAA    #240
        STAA    R1
L1      NOP         ;1 Intruction Clk Cycle
        NOP         ;1
        NOP         ;1
        DEC     R1  ;4
        BNE     L1  ;3
        DEC     R2  ;Total Instr.Clk=10
        BNE     L2
        DEC     R3
        BNE     L3
;--------------        
        PULA			;Restore Reg A
        RTS
;-------------------


DELAY75: ;delay for 75 75 milliseconds
        PSHA		;Save Reg A on Stack
        LDAA    #75		  
        STAA    R3		
;-- 1 msec delay. The Serial Monitor works at speed of 48MHz with XTAL=8MHz on Dragon12+ board
;Freq. for Instruction Clock Cycle is 24MHz (1/2 of 48Mhz). 
;(1/24MHz) x 10 Clk x240x100=1 msec. Overheads are excluded in this calculation.         
LL3      LDAA    #100
        STAA    R2
LL2      LDAA    #240
        STAA    R1
LL1      NOP         ;1 Intruction Clk Cycle
        NOP         ;1
        NOP         ;1
        DEC     R1  ;4
        BNE     LL1  ;3
        DEC     R2  ;Total Instr.Clk=10
        BNE     LL2
        DEC     R3
        BNE     LL3
;--------------        
        PULA			;Restore Reg A
        RTS
;-------------------

DISPLAY:

        LDX   #NAME
LOOP    LDAA	0,X
        BEQ   OVER  	
  		  JSR	  DATWRT4    	
  		  JSR   DELAY
  		  INX
  		  BRA   LOOP
  		  
OVER	  RTS

        END

