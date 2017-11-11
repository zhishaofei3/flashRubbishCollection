package src{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import flash.utils.*;
	import src.AS.*;

	public class Main extends Sprite {
		public static var jifenTxt:TextField;
		private var _box1:box1;
		private var _box2:box2;
		private var _box3:box3;
		private var _rub1:rub1;
		private var _rub2:rub2;
		private var _rub3:rub3;
		private var _rub4:rub4;
		private var _rub5:rub5;
		private var _rub6:rub6;
		private var _rub7:rub7;
		private var _rub8:rub8;
		public static var _jifen:int = 0;
		private static var __level:int;
		private static var levelTxt:TextField;
		private static var eventHelper:EventHelper;
		private var timer1:Timer;
		private var timer2:Timer;
		private var line:Line;
		private var startBtn:Sprite;
		private var rubArray;
		public function Main():void {
			eventHelper = new EventHelper();
			rubArray = new Array();
			jifenTxt = new TextField();
			jifenTxt.x = 662;
			jifenTxt.y = 76;
			jifenTxt.defaultTextFormat = getTextFormat();
			levelTxt = new TextField();
			levelTxt.x = 50;
			levelTxt.y = 76;
			levelTxt.defaultTextFormat = getTextFormat();
			line = new Line();
			line.x = 600;
			line.y = 380;
			line.width = 400;
			line.height = 60;
			eventHelper.addEventListener("2",function(){
			 startLevel(2);
			 });
			eventHelper.addEventListener("3",function(){
			 startLevel(3);
			 });
			eventHelper.addEventListener("4",function(){
			 startLevel(4);
			 });
			startBtn = new Start();
			startBtn.start_btn.addEventListener(MouseEvent.CLICK, onStart);
			startBtn.x = 270;
			startBtn.y = 180;
			addChild(startBtn);
		}
		
		private function onStart(e:MouseEvent):void{
			removeChild(startBtn);
			startLevel(1);
		}

		public function startLevel(cLevel:int):void {
			jifenTxt.text = _jifen + "分";
			addChild(jifenTxt);
			addChild(levelTxt);
			addChild(line);
			trace("startLevel了");
			if (cLevel==4) {
				Game_OVER();
				return;
			} else {
				if (cLevel == 1) {
					instanceBox1(300,300);
					time_kongzhi(15);
				} else if (cLevel == 2) {
					instanceBox1(200,300);
					instanceBox2(400,300);
					time_kongzhi(20);
				} else if (cLevel == 3) {
					instanceBox1(500,300);
					instanceBox2(300,300);
					instanceBox3(100,300);
					time_kongzhi(10);
				}
			}
			level = cLevel;
			levelTxt.text = "第" + cLevel + "关";
		}

		public function Game_OVER(e:TimerEvent = null) {
			timer1.stop();
			timer1.removeEventListener(TimerEvent.TIMER, createRub);
			timer2.stop();
			timer2.removeEventListener(TimerEvent.TIMER, onTimer);
			timer2.removeEventListener(TimerEvent.TIMER, Game_OVER);
			removeChild(jifenTxt);
			removeChild(levelTxt);
			removeChild(line);
			if(_box1 && contains(_box1 as DisplayObject)){
				removeChild(_box1 as DisplayObject);
			}
			if(_box2 && contains(_box2 as DisplayObject)){
				removeChild(_box2 as DisplayObject);
			}
			if(_box3 && contains(_box3 as DisplayObject)){
				removeChild(_box3 as DisplayObject);
			}
			for(var i:int=0,len = rubArray.length;i<=len; i++){
				var rub:Sprite = rubArray.pop();
				if(rub && contains(rub)){
					removeChild(rub);
				}
			}
			addChild(startBtn);
		}

		public function time_kongzhi(t:int) {
			if(!timer1){
				timer1 = new Timer(1500);
				timer1.start()
				timer1.addEventListener(TimerEvent.TIMER, createRub);
			}
			if(timer2){
				timer2.stop();
				timer2.removeEventListener(TimerEvent.TIMER, onTimer);
				timer2.removeEventListener(TimerEvent.TIMER, Game_OVER);
			}
			trace("zouni");
			timer2 = new Timer(1000,t);
			timer2.start();
			timer2.addEventListener(TimerEvent.TIMER, onTimer);
			timer2.addEventListener(TimerEvent.TIMER_COMPLETE, Game_OVER);
		}

		private function onTimer(e:TimerEvent):void {
			var timer = e.target;
			line.gotoAndStop(int((timer.currentCount / timer.repeatCount) * 100));
		}

		private function instanceBox1(px:Number,py:Number):void {
			if(_box1 && contains(_box1 as DisplayObject)){
				removeChild(_box1 as DisplayObject);
			}
			_box1 = new box1(px,py);
			addChild(_box1);
		}

		private function instanceBox2(px:Number,py:Number):void {
			if(_box2 && contains(_box2 as DisplayObject)){
				removeChild(_box2 as DisplayObject);
			}
			_box2 = new box2(px,py);
			addChild(_box2);
		}
		
		private function instanceBox3(px:Number,py:Number):void {
			if(_box3 && contains(_box3 as DisplayObject)){
				removeChild(_box3 as DisplayObject);
			}
			_box3 = new box3(px,py);
			addChild(_box3);
		}

		private function createRub(e:TimerEvent):void {
			var _loc_2:int = int(Math.random() * 10 + 1);
			switch (_loc_2) {
				case 1 :
					_rub1 = new rub1(_box1,_box2,_box3);
					addChild(_rub1);
					rubArray.push(_rub1);
					break;
				case 2 :
					_rub2 = new rub2(_box1,_box2,_box3);
					addChild(_rub2);
					rubArray.push(_rub2);
					break;
				case 3 :
					_rub3 = new rub3(_box1,_box2,_box3);
					addChild(_rub3);
					rubArray.push(_rub3);
					break;
				case 4 :
					_rub4 = new rub4(_box1,_box2,_box3);
					addChild(_rub4);
					rubArray.push(_rub4);
					break;
				case 5 :
					_rub5 = new rub5(_box1,_box2,_box3);
					addChild(_rub5);
					rubArray.push(_rub5);
					break;
				case 6 :
					_rub6 = new rub6(_box1,_box2,_box3);
					addChild(_rub6);
					rubArray.push(_rub6);
					break;
				case 7 :
					_rub7 = new rub7(_box1,_box2,_box3);
					addChild(_rub7);
					rubArray.push(_rub7);
					break;
				case 8 :
					_rub8 = new rub8(_box1,_box2,_box3);
					addChild(_rub8);
					rubArray.push(_rub8);
					break;
				case 9 :
					_rub7 = new rub7(_box1,_box2,_box3);
					addChild(_rub7);
					rubArray.push(_rub7);
					break;
				case 10 :
					_rub8 = new rub8(_box1,_box2,_box3);
					addChild(_rub8);
					rubArray.push(_rub8);
					break;
				default :
					break;
			}
		}

		public static function set jifen(jf:int):void {
			if (jf<0) {
				_jifen = 0;
			} else {
				_jifen = jf;
			}
			trace(_jifen);

			if (level == 1 && _jifen>=10) {
				eventHelper.dispatchEvent(new Event("2"));
			} else if (level==2 && _jifen>=20) {
				eventHelper.dispatchEvent(new Event("3"));
			} else if (level == 3 && _jifen > 30) {
				eventHelper.dispatchEvent(new Event("4"));
			}
			jifenTxt.text = _jifen + "分";
		}

		public static function get jifen():int {
			return _jifen;
		}

		private static function set level(l:int):void {
			__level = l;
			levelTxt.text = "第" + l + "关";
		}

		private static function get level():int {
			return __level;
		}

		private function getTextFormat():TextFormat {
			var tf:TextFormat = new TextFormat(null,30,0xFF0000);
			return tf;
		}

	}
}