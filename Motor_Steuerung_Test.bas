$regfile = "m8def.dat"
$crystal = 1000000


'LED output
MotorAr Alias Portc.5
Config MotorAr = Output
MotorAl Alias Portc.4
Config MotorAl = Output


'Interrupt Taster1
Taster1 Alias Pind.2
Config Taster1 = Input
Taster1 = 1
On Int0 On_int0
Config Int0 = Falling
Enable Int0

'Interrupt Tater2
Taster2 Alias Pind.3
config Taster2= Input
Taster2 = 1
On Int1 On_int1
config int1 = falling
enable int1

'PWM LED
Pwm1 Alias Portb.1
Config Pwm1 = Output
Config Timer1 =Pwm, Pwm = 8, Compare A Pwm = Clear Up, Prescale = 1

Enable Interrupts

MotorAr = 1
MotorAl = 0
compare1a = 255

Do


Loop

End

On_int0:

   'pwm up
   if Compare1a <= 235 then
      compare1a = compare1a + 20
   end if

Return

On_int1:

   'pwm down
   if Compare1a >= 20 then
      Compare1a = compare1a - 20
   End if


Return