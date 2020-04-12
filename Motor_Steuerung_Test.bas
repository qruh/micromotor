$regfile = "m8def.dat"
$crystal = 1000000

'neue Ã¤nderung zum github pull test

'Motor Output Pin
MotorAr Alias Portc.5
Config MotorAr = Output
MotorAl Alias Portc.4
Config MotorAl = Output

'Input Pin
Nacht Alias PinC.3
Config Nacht = Input
Spin Alias PinC.2
Config Spin = Input


'Timer1 as timer
Config Timer1 = Timer, Prescale =64


'Timer2 as PWM
Pwm1 Alias Portb.3
Config Pwm1 = Output
'Config Timer1 =Pwm, Pwm = 8, Compare A Pwm = Clear Up, Prescale = 1  'für PortB.1...
Config Timer2 = Pwm, Prescale = 1, Compare Pwm = Clear Down


MotorAr = 1
MotorAl = 0
Ocr2 = 255  '255= aus ; 0= an

Do


Loop

End

On_int0:

   'pwm up
   if Ocr2 <= 235 then
      Ocr2 = Ocr2 + 20
   end if

Return

On_int1:

   'pwm down
   if Ocr2 >= 20 then
      Ocr2 = Ocr2 - 20
   End if


Return