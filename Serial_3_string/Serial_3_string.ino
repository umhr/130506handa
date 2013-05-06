#include <LiquidCrystal.h>
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
String str;

void setup() {
  lcd.begin(16, 2);
  lcd.print("hello, world!");
  
  Serial.begin(9600);
}

void loop() {
  lcd.setCursor(0, 1);
  lcd.print(millis()/1000);
  
  lcd.setCursor(6, 1);
  while (Serial.available()) {
    //lcd.print(char(Serial.read()));
    str += char(Serial.read());
  }
  lcd.print(str);
  
  Serial.print("BooFooWoo\n");
  delay(1000);
}

