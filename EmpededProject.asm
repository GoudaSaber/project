
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;EmpededProject.c,3 :: 		void interrupt(){
;EmpededProject.c,4 :: 		if(intf_bit==1)
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt0
;EmpededProject.c,6 :: 		intf_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;EmpededProject.c,7 :: 		manual++;
	INCF       _manual+0, 1
;EmpededProject.c,8 :: 		}
L_interrupt0:
;EmpededProject.c,9 :: 		}
L_end_interrupt:
L__interrupt55:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;EmpededProject.c,11 :: 		void main(){
;EmpededProject.c,13 :: 		trisd=0;
	CLRF       TRISD+0
;EmpededProject.c,14 :: 		portd=0;
	CLRF       PORTD+0
;EmpededProject.c,15 :: 		trisb=0;
	CLRF       TRISB+0
;EmpededProject.c,16 :: 		trisb.b0=1;
	BSF        TRISB+0, 0
;EmpededProject.c,17 :: 		portb=0;
	CLRF       PORTB+0
;EmpededProject.c,18 :: 		trisa.b4=1;
	BSF        TRISA+0, 4
;EmpededProject.c,19 :: 		trisc.b0=0;
	BCF        TRISC+0, 0
;EmpededProject.c,20 :: 		trisc.b1=0;
	BCF        TRISC+0, 1
;EmpededProject.c,21 :: 		trisc.b3=1;
	BSF        TRISC+0, 3
;EmpededProject.c,22 :: 		trisc.b4=1;
	BSF        TRISC+0, 4
;EmpededProject.c,23 :: 		portc.b0=1;
	BSF        PORTC+0, 0
;EmpededProject.c,24 :: 		portc.b1=1;
	BSF        PORTC+0, 1
;EmpededProject.c,25 :: 		while(porta.b4==1);
L_main1:
	BTFSS      PORTA+0, 4
	GOTO       L_main2
	GOTO       L_main1
L_main2:
;EmpededProject.c,26 :: 		while(portc.B3==1&&portb.B0==1);
L_main3:
	BTFSS      PORTC+0, 3
	GOTO       L_main4
	BTFSS      PORTB+0, 0
	GOTO       L_main4
L__main53:
	GOTO       L_main3
L_main4:
;EmpededProject.c,27 :: 		if(portc.b3==0){
	BTFSC      PORTC+0, 3
	GOTO       L_main7
;EmpededProject.c,28 :: 		loop:
___main_loop:
;EmpededProject.c,29 :: 		for(;;)
L_main8:
;EmpededProject.c,31 :: 		if(portb.B0==0){
	BTFSC      PORTB+0, 0
	GOTO       L_main11
;EmpededProject.c,32 :: 		break;
	GOTO       L_main9
;EmpededProject.c,33 :: 		}
L_main11:
;EmpededProject.c,34 :: 		for(i=count1;i>=0;i--){
	MOVF       _count1+0, 0
	MOVWF      _i+0
	MOVF       _count1+1, 0
	MOVWF      _i+1
L_main12:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main57
	MOVLW      0
	SUBWF      _i+0, 0
L__main57:
	BTFSS      STATUS+0, 0
	GOTO       L_main13
;EmpededProject.c,35 :: 		for(s=0;s<=50;s++){
	CLRF       main_s_L0+0
L_main15:
	MOVF       main_s_L0+0, 0
	SUBLW      50
	BTFSS      STATUS+0, 0
	GOTO       L_main16
;EmpededProject.c,36 :: 		if(portb.B0==0){
	BTFSC      PORTB+0, 0
	GOTO       L_main18
;EmpededProject.c,37 :: 		portc.b0=1;
	BSF        PORTC+0, 0
;EmpededProject.c,38 :: 		portc.b1=1;
	BSF        PORTC+0, 1
;EmpededProject.c,39 :: 		break;
	GOTO       L_main16
;EmpededProject.c,40 :: 		}
L_main18:
;EmpededProject.c,41 :: 		portd.b0=1 ;
	BSF        PORTD+0, 0
;EmpededProject.c,42 :: 		portd.b1=0;
	BCF        PORTD+0, 1
;EmpededProject.c,43 :: 		portd.B2=0;
	BCF        PORTD+0, 2
;EmpededProject.c,44 :: 		portc.b0=0;
	BCF        PORTC+0, 0
;EmpededProject.c,45 :: 		portc.B1=1;
	BSF        PORTC+0, 1
;EmpededProject.c,46 :: 		portd.b5=1;
	BSF        PORTD+0, 5
;EmpededProject.c,47 :: 		portd.B3=0;
	BCF        PORTD+0, 3
;EmpededProject.c,48 :: 		if(i<=3){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main58
	MOVF       _i+0, 0
	SUBLW      3
L__main58:
	BTFSS      STATUS+0, 0
	GOTO       L_main19
;EmpededProject.c,49 :: 		portd.b5=0;
	BCF        PORTD+0, 5
;EmpededProject.c,50 :: 		portd.B4=1;}
	BSF        PORTD+0, 4
L_main19:
;EmpededProject.c,51 :: 		right=i%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       FLOC__main+0, 0
	MOVWF      _right+0
	MOVF       FLOC__main+1, 0
	MOVWF      _right+1
;EmpededProject.c,52 :: 		left=i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _left+0
	MOVF       R0+1, 0
	MOVWF      _left+1
;EmpededProject.c,53 :: 		portb=right<<1;
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;EmpededProject.c,54 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	NOP
;EmpededProject.c,55 :: 		portc.b0=1;
	BSF        PORTC+0, 0
;EmpededProject.c,56 :: 		portc.B1=0;
	BCF        PORTC+0, 1
;EmpededProject.c,57 :: 		portb=left<<1;
	MOVF       _left+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;EmpededProject.c,58 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	NOP
;EmpededProject.c,35 :: 		for(s=0;s<=50;s++){
	INCF       main_s_L0+0, 1
;EmpededProject.c,59 :: 		}
	GOTO       L_main15
L_main16:
;EmpededProject.c,34 :: 		for(i=count1;i>=0;i--){
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;EmpededProject.c,60 :: 		}
	GOTO       L_main12
L_main13:
;EmpededProject.c,61 :: 		for(j=count2;j>=0;j--){
	MOVF       _count2+0, 0
	MOVWF      _j+0
	MOVF       _count2+1, 0
	MOVWF      _j+1
L_main22:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main59
	MOVLW      0
	SUBWF      _j+0, 0
L__main59:
	BTFSS      STATUS+0, 0
	GOTO       L_main23
;EmpededProject.c,62 :: 		for(s=0;s<=50;s++){
	CLRF       main_s_L0+0
L_main25:
	MOVF       main_s_L0+0, 0
	SUBLW      50
	BTFSS      STATUS+0, 0
	GOTO       L_main26
;EmpededProject.c,63 :: 		if(portb.B0==0){
	BTFSC      PORTB+0, 0
	GOTO       L_main28
;EmpededProject.c,64 :: 		portc.b0=1;
	BSF        PORTC+0, 0
;EmpededProject.c,65 :: 		portc.b1=1;
	BSF        PORTC+0, 1
;EmpededProject.c,66 :: 		break;
	GOTO       L_main26
;EmpededProject.c,67 :: 		}
L_main28:
;EmpededProject.c,68 :: 		portd.b0=0;
	BCF        PORTD+0, 0
;EmpededProject.c,69 :: 		portd.b4=0;
	BCF        PORTD+0, 4
;EmpededProject.c,70 :: 		portc.b0=0;
	BCF        PORTC+0, 0
;EmpededProject.c,71 :: 		portc.b1=1;
	BSF        PORTC+0, 1
;EmpededProject.c,72 :: 		portd.B2=1;
	BSF        PORTD+0, 2
;EmpededProject.c,73 :: 		portd.b3=1;
	BSF        PORTD+0, 3
;EmpededProject.c,74 :: 		right=j%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _j+0, 0
	MOVWF      R0+0
	MOVF       _j+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       FLOC__main+0, 0
	MOVWF      _right+0
	MOVF       FLOC__main+1, 0
	MOVWF      _right+1
;EmpededProject.c,75 :: 		left=j/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _j+0, 0
	MOVWF      R0+0
	MOVF       _j+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _left+0
	MOVF       R0+1, 0
	MOVWF      _left+1
;EmpededProject.c,76 :: 		portb=right<<1;
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;EmpededProject.c,77 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	DECFSZ     R12+0, 1
	GOTO       L_main29
	NOP
;EmpededProject.c,78 :: 		portc.b0=1;
	BSF        PORTC+0, 0
;EmpededProject.c,79 :: 		portc.B1=0;
	BCF        PORTC+0, 1
;EmpededProject.c,80 :: 		portb=left<<1;
	MOVF       _left+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;EmpededProject.c,81 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main30:
	DECFSZ     R13+0, 1
	GOTO       L_main30
	DECFSZ     R12+0, 1
	GOTO       L_main30
	NOP
;EmpededProject.c,62 :: 		for(s=0;s<=50;s++){
	INCF       main_s_L0+0, 1
;EmpededProject.c,82 :: 		}
	GOTO       L_main25
L_main26:
;EmpededProject.c,61 :: 		for(j=count2;j>=0;j--){
	MOVLW      1
	SUBWF      _j+0, 1
	BTFSS      STATUS+0, 0
	DECF       _j+1, 1
;EmpededProject.c,83 :: 		}
	GOTO       L_main22
L_main23:
;EmpededProject.c,84 :: 		for(k=count3;k>=0;k--)
	MOVF       _count3+0, 0
	MOVWF      _k+0
	MOVF       _count3+1, 0
	MOVWF      _k+1
L_main31:
	MOVLW      128
	XORWF      _k+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main60
	MOVLW      0
	SUBWF      _k+0, 0
L__main60:
	BTFSS      STATUS+0, 0
	GOTO       L_main32
;EmpededProject.c,86 :: 		for(s=0;s<=50;s++){
	CLRF       main_s_L0+0
L_main34:
	MOVF       main_s_L0+0, 0
	SUBLW      50
	BTFSS      STATUS+0, 0
	GOTO       L_main35
;EmpededProject.c,87 :: 		if(portb.B0==0){
	BTFSC      PORTB+0, 0
	GOTO       L_main37
;EmpededProject.c,88 :: 		portc.b0=1;
	BSF        PORTC+0, 0
;EmpededProject.c,89 :: 		portc.b1=1;
	BSF        PORTC+0, 1
;EmpededProject.c,90 :: 		break;
	GOTO       L_main35
;EmpededProject.c,91 :: 		}
L_main37:
;EmpededProject.c,92 :: 		portd.b1=1;
	BSF        PORTD+0, 1
;EmpededProject.c,93 :: 		portd.b2=0;
	BCF        PORTD+0, 2
;EmpededProject.c,94 :: 		portc.b0=0;
	BCF        PORTC+0, 0
;EmpededProject.c,95 :: 		portc.B1=1;
	BSF        PORTC+0, 1
;EmpededProject.c,96 :: 		portd.b3=1;
	BSF        PORTD+0, 3
;EmpededProject.c,97 :: 		right=k%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _k+0, 0
	MOVWF      R0+0
	MOVF       _k+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       FLOC__main+0, 0
	MOVWF      _right+0
	MOVF       FLOC__main+1, 0
	MOVWF      _right+1
;EmpededProject.c,98 :: 		left=k/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _k+0, 0
	MOVWF      R0+0
	MOVF       _k+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _left+0
	MOVF       R0+1, 0
	MOVWF      _left+1
;EmpededProject.c,99 :: 		portb=right<<1;
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;EmpededProject.c,100 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main38:
	DECFSZ     R13+0, 1
	GOTO       L_main38
	DECFSZ     R12+0, 1
	GOTO       L_main38
	NOP
;EmpededProject.c,101 :: 		portc.b0=1;
	BSF        PORTC+0, 0
;EmpededProject.c,102 :: 		portc.B1=0;
	BCF        PORTC+0, 1
;EmpededProject.c,103 :: 		portb=left<<1;
	MOVF       _left+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;EmpededProject.c,104 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main39:
	DECFSZ     R13+0, 1
	GOTO       L_main39
	DECFSZ     R12+0, 1
	GOTO       L_main39
	NOP
;EmpededProject.c,86 :: 		for(s=0;s<=50;s++){
	INCF       main_s_L0+0, 1
;EmpededProject.c,105 :: 		}
	GOTO       L_main34
L_main35:
;EmpededProject.c,84 :: 		for(k=count3;k>=0;k--)
	MOVLW      1
	SUBWF      _k+0, 1
	BTFSS      STATUS+0, 0
	DECF       _k+1, 1
;EmpededProject.c,106 :: 		}
	GOTO       L_main31
L_main32:
;EmpededProject.c,107 :: 		}
	GOTO       L_main8
L_main9:
;EmpededProject.c,108 :: 		}
L_main7:
;EmpededProject.c,110 :: 		gie_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;EmpededProject.c,111 :: 		inte_bit=1;
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;EmpededProject.c,112 :: 		intedg_bit=1;//1 for rising edge and 0 for falling edge
	BSF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;EmpededProject.c,114 :: 		while(1)
L_main40:
;EmpededProject.c,116 :: 		if(manual==1){
	MOVF       _manual+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main42
;EmpededProject.c,117 :: 		if(portc.b3==0)
	BTFSC      PORTC+0, 3
	GOTO       L_main43
;EmpededProject.c,118 :: 		goto loop;
	GOTO       ___main_loop
L_main43:
;EmpededProject.c,119 :: 		portd.b0=1 ;
	BSF        PORTD+0, 0
;EmpededProject.c,120 :: 		portd.b1=0;
	BCF        PORTD+0, 1
;EmpededProject.c,121 :: 		portd.B2=0;
	BCF        PORTD+0, 2
;EmpededProject.c,122 :: 		portd.b5=1;
	BSF        PORTD+0, 5
;EmpededProject.c,123 :: 		portd.B3=0;
	BCF        PORTD+0, 3
;EmpededProject.c,124 :: 		}
L_main42:
;EmpededProject.c,125 :: 		if(manual==2){
	MOVF       _manual+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main44
;EmpededProject.c,126 :: 		if(portc.b3==0)
	BTFSC      PORTC+0, 3
	GOTO       L_main45
;EmpededProject.c,127 :: 		goto loop;
	GOTO       ___main_loop
L_main45:
;EmpededProject.c,128 :: 		portd.b5=0;
	BCF        PORTD+0, 5
;EmpededProject.c,129 :: 		portd.b0=1;
	BSF        PORTD+0, 0
;EmpededProject.c,130 :: 		portd.b4=1;
	BSF        PORTD+0, 4
;EmpededProject.c,131 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main46:
	DECFSZ     R13+0, 1
	GOTO       L_main46
	DECFSZ     R12+0, 1
	GOTO       L_main46
	DECFSZ     R11+0, 1
	GOTO       L_main46
	NOP
;EmpededProject.c,132 :: 		portd.b0=0;
	BCF        PORTD+0, 0
;EmpededProject.c,133 :: 		portd.b4=0;
	BCF        PORTD+0, 4
;EmpededProject.c,134 :: 		portd.B2=1;
	BSF        PORTD+0, 2
;EmpededProject.c,135 :: 		portd.b3=1;
	BSF        PORTD+0, 3
;EmpededProject.c,136 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main47:
	DECFSZ     R13+0, 1
	GOTO       L_main47
	DECFSZ     R12+0, 1
	GOTO       L_main47
	DECFSZ     R11+0, 1
	GOTO       L_main47
	NOP
;EmpededProject.c,137 :: 		}
L_main44:
;EmpededProject.c,138 :: 		if(manual==3)
	MOVF       _manual+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_main48
;EmpededProject.c,140 :: 		if(portc.b3==0)
	BTFSC      PORTC+0, 3
	GOTO       L_main49
;EmpededProject.c,141 :: 		goto loop;
	GOTO       ___main_loop
L_main49:
;EmpededProject.c,142 :: 		portd.B2=0;
	BCF        PORTD+0, 2
;EmpededProject.c,143 :: 		portd.b3=1;
	BSF        PORTD+0, 3
;EmpededProject.c,144 :: 		portd.b1=1;
	BSF        PORTD+0, 1
;EmpededProject.c,145 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main50:
	DECFSZ     R13+0, 1
	GOTO       L_main50
	DECFSZ     R12+0, 1
	GOTO       L_main50
	DECFSZ     R11+0, 1
	GOTO       L_main50
	NOP
;EmpededProject.c,146 :: 		portd.b3=0;
	BCF        PORTD+0, 3
;EmpededProject.c,147 :: 		portd.b1=0;
	BCF        PORTD+0, 1
;EmpededProject.c,148 :: 		portd.b0=1;
	BSF        PORTD+0, 0
;EmpededProject.c,149 :: 		portd.b5=1;
	BSF        PORTD+0, 5
;EmpededProject.c,150 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main51:
	DECFSZ     R13+0, 1
	GOTO       L_main51
	DECFSZ     R12+0, 1
	GOTO       L_main51
	DECFSZ     R11+0, 1
	GOTO       L_main51
	NOP
;EmpededProject.c,151 :: 		}
L_main48:
;EmpededProject.c,153 :: 		if(manual==4)
	MOVF       _manual+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_main52
;EmpededProject.c,154 :: 		manual=2;
	MOVLW      2
	MOVWF      _manual+0
L_main52:
;EmpededProject.c,159 :: 		}
	GOTO       L_main40
;EmpededProject.c,160 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
