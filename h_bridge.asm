
_main:

;h_bridge.c,16 :: 		void main() {
;h_bridge.c,17 :: 		trisd=0;
	CLRF       TRISD+0
;h_bridge.c,18 :: 		lcd_init();
	CALL       _Lcd_Init+0
;h_bridge.c,19 :: 		lcd_out(1,1,"hello");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_h_bridge+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;h_bridge.c,20 :: 		while(1)
L_main0:
;h_bridge.c,22 :: 		rd1_bit=0;
	BCF        RD1_bit+0, 1
;h_bridge.c,23 :: 		rd0_bit=1;
	BSF        RD0_bit+0, 0
;h_bridge.c,24 :: 		rd2_bit=1;
	BSF        RD2_bit+0, 2
;h_bridge.c,25 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;h_bridge.c,26 :: 		rd1_bit=1;
	BSF        RD1_bit+0, 1
;h_bridge.c,27 :: 		rd0_bit=0;
	BCF        RD0_bit+0, 0
;h_bridge.c,28 :: 		rd2_bit=1;
	BSF        RD2_bit+0, 2
;h_bridge.c,29 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;h_bridge.c,30 :: 		}
	GOTO       L_main0
;h_bridge.c,32 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
