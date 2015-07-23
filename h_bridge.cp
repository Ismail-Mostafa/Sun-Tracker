#line 1 "E:/Arab tech/Projects 2012/Sun Tracker/h_bridge.c"
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D4 at RB0_bit;


sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB0_bit;

void main() {
trisd=0;
lcd_init();
lcd_out(1,1,"hello");
while(1)
{
rd1_bit=0;
rd0_bit=1;
rd2_bit=1;
delay_ms(1000);
rd1_bit=1;
rd0_bit=0;
rd2_bit=1;
delay_ms(1000);
}

}
