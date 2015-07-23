#line 1 "E:/Arab tech/Projects 2012/Sun Tracker/sun1.c"
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;

sbit in1 at rc4_bit;
sbit in2 at rc5_bit;
sbit en at rc1_bit;

void main() {
int v1,v2,v3,x1,x2,i;
char txt[7];
lcd_init();
lcd_cmd(_lcd_clear);
lcd_cmd(_lcd_cursor_off );
lcd_out(1,1,"Sun Tracker");
trisc=0b00000000;
trisd=0b00000011;
while(1)
{
delay_ms(200);
v1=adc_read(1);
v2=adc_read(2);
v3=adc_read(3);
i=adc_read(4)*150;
x1=v2-v1;
x2=v2-v3;
inttostr(i,txt);
lcd_out(2,1,"I= ");
lcd_out(2,4,txt);
lcd_out_cp(" uA");
while(i>=1500)
{
en=0;
lcd_out(2,1,"Motor Off       ");
delay_ms(2000);
i=adc_read(4)*150;
}
if(rd0_bit==0)
{
en=1;
in1=1;
in2=0;
while(rd1_bit==1);
en=0;
in1=0;
in2=0;
}
if(x1<-20)
{
en=1;
in1=1;
in2=0;
}
 else if(x2<-20)
 {
in1=0;
in2=1;
en=1;
}
else
{
en=0;
}
}

}
