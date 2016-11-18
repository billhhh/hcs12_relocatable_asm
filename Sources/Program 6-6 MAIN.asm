  XREF CAL_CHKSUM
	XREF TEST_CHKSUM
	XDEF	MYRAM
	XDEF	COUNTREG
	XDEF	CNTVAL
	XDEF	CNTVAL1
MYRAM 	EQU $860
COUNTREG 	EQU $820		
CNTVAL 	EQU 4			
CNTVAL1 	EQU 5			
	LDS	#$900
	JSR	COPY_DATA		
	JSR	CAL_CHKSUM		
	JSR	TEST_CHKSUM		
	BRA	$
COPY_DATA
	LDX	 #MYBYTE	
	LDY	 #MYRAM	
	LDAA	 #CNTVAL
	STAA	 COUNTREG 
B1	LDAA	 1,X+	 
	STAA	 1,Y+		
	DEC	 COUNTREG
	BNE	 B1 		
	RTS			
	ORG $8500
MYBYTE FCB $25, $62, $3F, $52, $00
	END