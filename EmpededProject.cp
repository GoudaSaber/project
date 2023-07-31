#line 1 "C:/Users/hp compac/Desktop/hamed/EmpededProject.c"
int left,right,i,j,k,count1=23,count2=12,count3=3;
 char manual=0;
 void interrupt(){
 if(intf_bit==1)
 {
 intf_bit=0;
 manual++;
 }
}

void main(){
char s;
trisd=0;
portd=0;
trisb=0;
trisb.b0=1;
portb=0;
trisa.b4=1;
trisc.b0=0;
trisc.b1=0;
trisc.b3=1;
trisc.b4=1;
portc.b0=1;
portc.b1=1;
while(porta.b4==1);
while(portc.B3==1&&portb.B0==1);
if(portc.b3==0){
loop:
for(;;)
{
if(portb.B0==0){
 break;
 }
 for(i=count1;i>=0;i--){
 for(s=0;s<=50;s++){
 if(portb.B0==0){
 portc.b0=1;
 portc.b1=1;
 break;
 }
 portd.b0=1 ;
 portd.b1=0;
 portd.B2=0;
 portc.b0=0;
 portc.B1=1;
 portd.b5=1;
 portd.B3=0;
 if(i<=3){
 portd.b5=0;
 portd.B4=1;}
 right=i%10;
 left=i/10;
 portb=right<<1;
 delay_ms(10);
 portc.b0=1;
 portc.B1=0;
 portb=left<<1;
 delay_ms(10);
 }
 }
 for(j=count2;j>=0;j--){
 for(s=0;s<=50;s++){
 if(portb.B0==0){
 portc.b0=1;
 portc.b1=1;
 break;
 }
 portd.b0=0;
 portd.b4=0;
 portc.b0=0;
 portc.b1=1;
 portd.B2=1;
 portd.b3=1;
 right=j%10;
 left=j/10;
 portb=right<<1;
 delay_ms(10);
 portc.b0=1;
 portc.B1=0;
 portb=left<<1;
 delay_ms(10);
 }
 }
 for(k=count3;k>=0;k--)
 {
 for(s=0;s<=50;s++){
 if(portb.B0==0){
 portc.b0=1;
 portc.b1=1;
 break;
 }
 portd.b1=1;
 portd.b2=0;
 portc.b0=0;
 portc.B1=1;
 portd.b3=1;
 right=k%10;
 left=k/10;
 portb=right<<1;
 delay_ms(10);
 portc.b0=1;
 portc.B1=0;
 portb=left<<1;
 delay_ms(10);
 }
 }
 }
 }

 gie_bit=1;
 inte_bit=1;
 intedg_bit=1;

 while(1)
 {
 if(manual==1){
 if(portc.b3==0)
 goto loop;
 portd.b0=1 ;
 portd.b1=0;
 portd.B2=0;
 portd.b5=1;
 portd.B3=0;
 }
 if(manual==2){
 if(portc.b3==0)
 goto loop;
 portd.b5=0;
 portd.b0=1;
 portd.b4=1;
 delay_ms(3000);
 portd.b0=0;
 portd.b4=0;
 portd.B2=1;
 portd.b3=1;
 delay_ms(2000);
 }
 if(manual==3)
 {
 if(portc.b3==0)
 goto loop;
 portd.B2=0;
 portd.b3=1;
 portd.b1=1;
 delay_ms(3000);
 portd.b3=0;
 portd.b1=0;
 portd.b0=1;
 portd.b5=1;
 delay_ms(2000);
 }

 if(manual==4)
 manual=2;




 }
 }
