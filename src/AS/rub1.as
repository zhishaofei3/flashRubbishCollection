package src.AS{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import src.*;

	public class rub1 extends MovieClip {
		private var b2:box2;
		private var b1:box1;
		private var b3:box3;
		private var speed:int = 3;

		public function rub1(param1:box1, param2:box2, param3:box3) {
			addFrameScript(0, frame1, 20, frame21, 44, frame45, 69, frame70);
			b1 = param1;
			b2 = param2;
			b3 = param3;
			x = -10;
			y = 20;
			mouseDown();
			mouseUp();
			readyMoveSelf();
			buttonMode = true;
			addEventListener(MouseEvent.MOUSE_OVER, _mouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, _mouseOut);

		}

		public function _mouseOut(event:MouseEvent) {
			readyMoveSelf();

		}

		public function _mouseOver(event:MouseEvent) {
			removeEventListener(Event.ENTER_FRAME, startMove);

		}

		private function readyMoveSelf():void {
			addEventListener(Event.ENTER_FRAME, startMove);

		}

		private function startMove(event:Event):void {
			if (parent && x >= 790) {
				trace("删除自己");
				parent.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, startMove);
			}
			x = x + speed;

		}

		public function mouseDown():void {
			addEventListener(MouseEvent.MOUSE_DOWN, _mouseDown);
			removeEventListener(Event.ENTER_FRAME, startMove);

		}

		private function _mouseDown(event:MouseEvent):void {
			startDrag();

		}

		private function stopMouseDown():void {
			removeEventListener(MouseEvent.MOUSE_DOWN, _mouseDown);

		}

		public function mouseUp():void {
			addEventListener(MouseEvent.MOUSE_UP, _mouseUp);

		}

		public function _onEnterFrame(event:Event) {
			if (currentFrame == 21) {
				//                Main.jifen = Main.jifen + 5;
				dispatchEvent(new UIEvent("score", 5));
				removeEventListener(Event.ENTER_FRAME, _onEnterFrame);
				trace("加5分");
				parent.removeChild(this);
			} else if (currentFrame == 45) {
				//               Main.jifen = Main.jifen - 5;
				dispatchEvent(new UIEvent("score", -5));
				removeEventListener(Event.ENTER_FRAME, _onEnterFrame);
				trace("减5分");
				parent.removeChild(this);
			} else if (currentFrame == 70) {
				//                Main.jifen = Main.jifen - 10;
				dispatchEvent(new UIEvent("score", -10));
				removeEventListener(Event.ENTER_FRAME, _onEnterFrame);
				trace("减10分");
				parent.removeChild(this);
			}

		}

		private function _mouseUp(event:MouseEvent):void {
			stopDrag();
			removeEventListener(Event.ENTER_FRAME, startMove);
			if (hitTestObject(b2)) {
				speed = 0;
				gotoAndPlay(2);
				b2.gotoAndPlay(2);
				addEventListener(Event.ENTER_FRAME, _onEnterFrame);
				trace("投递垃圾成功");
			} else if (hitTestObject(b1)) {
				speed = 0;
				gotoAndPlay(22);
				b1.gotoAndPlay(31);
				addEventListener(Event.ENTER_FRAME, _onEnterFrame);
				trace("投递错误");
			} else if (hitTestObject(b3)) {
				speed = 0;
				b3.gotoAndPlay(31);
				gotoAndPlay(22);
				addEventListener(Event.ENTER_FRAME, _onEnterFrame);
				trace("投递错误");
			} else if (y >= 30) {
				speed = 0;
				gotoAndPlay(46);
				addEventListener(Event.ENTER_FRAME, _onEnterFrame);
				trace("投递错误");
			}

		}

		private function stopMouseUp():void {
			removeEventListener(MouseEvent.MOUSE_UP, _mouseUp);

		}

		function frame1() {
			stop();

		}

		function frame21() {
			stop();

		}

		function frame45() {
			stop();

		}

		function frame70() {
			stop();

		}

	}
}