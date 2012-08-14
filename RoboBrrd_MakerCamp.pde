// RoboBrrd @ Maker Camp
// robobrrd.com/makercamp

#include <Servo.h> // use the servo lib

Servo rwing, lwing, beak; // names of our servos

// pins that our servos are attached to
const int rpin = 11;
const int lpin = 10;
const int bpin = 9;

// our max and min values of the right wing
const int r_upper = 55;
const int r_lower = 125;

// our ldr pin
const int ldr = A0;

// our ldr max & mins
const int ldr_max = 500;
const int ldr_min = 50;

// int for mapped val (see last part in loop)
int scaled = 0;

void setup() {
  
  Serial.begin(9600);
  rwing.attach(rpin);
  lwing.attach(lpin);
  beak.attach(bpin); 
  
  pinMode(ldr, INPUT);
  
}

void loop() {
  
  // this part is for figuring out your
  // min and max values (remember to press
  // serial monitor)
  /*
  for(int i=0; i<180; i++) {
    rwing.write(i);
    delay(10);
    Serial.println(i);
  }
  */
  
  // this part is for now testing your
  // min and max values :)
  /*
  rwing.write(r_upper);
  delay(100);
  rwing.write(r_lower);
  delay(100);
  */
  
  // this part is for looking at your
  // sensor's values and determining
  // the max and min
  /*
  Serial.println(analogRead(ldr));
  delay(100);
  */
  
  // this part is for using all the max and
  // min values, to control a servo with
  // the sensor!
  // TADA!!! A ROBOT! :)
  scaled = map(analogRead(ldr), ldr_min, ldr_max, r_upper, r_lower);
  rwing.write(scaled);
  
}

