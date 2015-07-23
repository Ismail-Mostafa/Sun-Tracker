
_main:

;sun1.c,19 :: 		void main() {
;sun1.c,22 :: 		lcd_init();
	CALL       _Lcd_Init+0
;sun1.c,23 :: 		lcd_cmd(_lcd_clear); // clear lcd
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;sun1.c,24 :: 		lcd_cmd(_lcd_cursor_off );
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;sun1.c,25 :: 		lcd_out(1,1,"Sun Tracker");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_sun1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;sun1.c,26 :: 		trisc=0b00000000;
	CLRF       TRISC+0
;sun1.c,27 :: 		trisd=0b00000011;
	MOVLW      3
	MOVWF      TRISD+0
;sun1.c,28 :: 		while(1)
L_main0:
;sun1.c,30 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;sun1.c,31 :: 		v1=adc_read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      main_v1_L0+0
	MOVF       R0+1, 0
	MOVWF      main_v1_L0+1
;sun1.c,32 :: 		v2=adc_read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      main_v2_L0+0
	MOVF       R0+1, 0
	MOVWF      main_v2_L0+1
;sun1.c,33 :: 		v3=adc_read(3);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      main_v3_L0+0
	MOVF       R0+1, 0
	MOVWF      main_v3_L0+1
;sun1.c,34 :: 		i=adc_read(4)*150;
	MOVLW      4
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVLW      150
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      main_i_L0+0
	MOVF       R0+1, 0
	MOVWF      main_i_L0+1
;sun1.c,35 :: 		x1=v2-v1;
	MOVF       main_v1_L0+0, 0
	SUBWF      main_v2_L0+0, 0
	MOVWF      main_x1_L0+0
	MOVF       main_v1_L0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      main_v2_L0+1, 0
	MOVWF      main_x1_L0+1
;sun1.c,36 :: 		x2=v2-v3;
	MOVF       main_v3_L0+0, 0
	SUBWF      main_v2_L0+0, 0
	MOVWF      main_x2_L0+0
	MOVF       main_v3_L0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      main_v2_L0+1, 0
	MOVWF      main_x2_L0+1
;sun1.c,37 :: 		inttostr(i,txt);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      main_txt_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;sun1.c,38 :: 		lcd_out(2,1,"I= ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_sun1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;sun1.c,39 :: 		lcd_out(2,4,txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_txt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;sun1.c,40 :: 		lcd_out_cp(" uA");
	MOVLW      ?lstr3_sun1+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;sun1.c,41 :: 		while(i>=1500)
L_main3:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      5
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      220
	SUBWF      main_i_L0+0, 0
L__main14:
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;sun1.c,43 :: 		en=0;
	BCF        RC1_bit+0, 1
;sun1.c,44 :: 		lcd_out(2,1,"Motor Off       ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_sun1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;sun1.c,45 :: 		delay_ms(2000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;sun1.c,46 :: 		i=adc_read(4)*150;
	MOVLW      4
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVLW      150
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      main_i_L0+0
	MOVF       R0+1, 0
	MOVWF      main_i_L0+1
;sun1.c,47 :: 		}
	GOTO       L_main3
L_main4:
;sun1.c,48 :: 		if(rd0_bit==0)
	BTFSC      RD0_bit+0, 0
	GOTO       L_main6
;sun1.c,50 :: 		en=1;
	BSF        RC1_bit+0, 1
;sun1.c,51 :: 		in1=1;
	BSF        RC4_bit+0, 4
;sun1.c,52 :: 		in2=0;
	BCF        RC5_bit+0, 5
;sun1.c,53 :: 		while(rd1_bit==1);
L_main7:
	BTFSS      RD1_bit+0, 1
	GOTO       L_main8
	GOTO       L_main7
L_main8:
;sun1.c,54 :: 		en=0;
	BCF        RC1_bit+0, 1
;sun1.c,55 :: 		in1=0;
	BCF        RC4_bit+0, 4
;sun1.c,56 :: 		in2=0;
	BCF        RC5_bit+0, 5
;sun1.c,57 :: 		}
L_main6:
;sun1.c,58 :: 		if(x1<-20)
	MOVLW      128
	XORWF      main_x1_L0+1, 0
	MOVWF      R0+0
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      236
	SUBWF      main_x1_L0+0, 0
L__main15:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;sun1.c,60 :: 		en=1;
	BSF        RC1_bit+0, 1
;sun1.c,61 :: 		in1=1;
	BSF        RC4_bit+0, 4
;sun1.c,62 :: 		in2=0;
	BCF        RC5_bit+0, 5
;sun1.c,63 :: 		}
	GOTO       L_main10
L_main9:
;sun1.c,64 :: 		else if(x2<-20)
	MOVLW      128
	XORWF      main_x2_L0+1, 0
	MOVWF      R0+0
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      236
	SUBWF      main_x2_L0+0, 0
L__main16:
	BTFSC      STATUS+0, 0
	GOTO       L_main11
;sun1.c,66 :: 		in1=0;
	BCF        RC4_bit+0, 4
;sun1.c,67 :: 		in2=1;
	BSF        RC5_bit+0, 5
;sun1.c,68 :: 		en=1;
	BSF        RC1_bit+0, 1
;sun1.c,69 :: 		}
	GOTO       L_main12
L_main11:
;sun1.c,72 :: 		en=0;
	BCF        RC1_bit+0, 1
;sun1.c,73 :: 		}
L_main12:
L_main10:
;sun1.c,74 :: 		}
	GOTO       L_main0
;sun1.c,76 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
