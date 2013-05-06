package {
	import com.bit101.components.HUISlider;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import funnel.*;
	import funnel.ui.*;

	/**
	 * Arduino Servo example
	 *
	 * Control a servo from AS3 via Funnel
	 *
	 * Preparation:
	 * * upload StandardFirmata to an Arduino board
	 * 
 	 * The circuit:
	 * * outputs
	 *   - D9: the servo pin
	 *
	 * http://funnel.cc/
	 * http://arduino.cc/
	 * http://firmata.org/
	 */
	public class ArduinoServoTest2 extends Sprite {
		private const SERVO_PIN:int = 9;

		private var aio:Arduino;
		private var servo:Servo;
		private var pulseGenerator:Timer;

		public function ArduinoServoTest2() {
			var config:Configuration = Arduino.FIRMATA;
			config.setDigitalPinMode(SERVO_PIN, SERVO);
			aio = new Arduino(config);
			servo = new Servo(aio.digitalPin(SERVO_PIN));
			
			var slider:HUISlider = new HUISlider(this, 0, 0, "Slider", onChange);
			slider.maximum = 180;
			slider.minimum = 0;
			
			//pulseGenerator = new Timer(1000);
			//pulseGenerator.addEventListener(TimerEvent.TIMER, onPulse);
			//pulseGenerator.start();
		}
		
		private function onChange(event:Event):void 
		{
			var slider:HUISlider = event.target as HUISlider;
			servo.angle = slider.value;
			trace(slider.value);
		}

		private function onPulse(e:TimerEvent):void {
			var angle:Number = Math.random() * 180;
			servo.angle = angle;
			trace("angle: " + servo.angle);
		}
	}
}