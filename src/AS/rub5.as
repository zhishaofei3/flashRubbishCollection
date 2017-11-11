package src.AS
{
    import flash.display.*;
    import flash.events.*;
    import src.*;

    public class rub5 extends MovieClip
    {
        private var b2:box2;
        private var b1:box1;
        private var b3:box3;
        private var speed:int = 3;

        public function rub5(param1:box1, param2:box2, param3:box3)
        {
            addFrameScript(0, this.frame1, 20, this.frame21, 44, this.frame45, 69, this.frame70);
            this.b1 = param1;
            this.b2 = param2;
            this.b3 = param3;
            x = -10;
            y = 20;
            this.mouseDown();
            this.mouseUp();
            this.readyMoveSelf();
            buttonMode = true;
            addEventListener(MouseEvent.MOUSE_OVER, this._mouseOver);
            addEventListener(MouseEvent.MOUSE_OUT, this._mouseOut);
            return;
        }// end function

        public function _mouseOut(event:MouseEvent)
        {
            this.readyMoveSelf();
            return;
        }// end function

        public function _mouseOver(event:MouseEvent)
        {
            removeEventListener(Event.ENTER_FRAME, this.startMove);
            return;
        }// end function

        private function readyMoveSelf() : void
        {
            addEventListener(Event.ENTER_FRAME, this.startMove);
            return;
        }// end function

        private function startMove(event:Event) : void
        {
            if (parent && x >= 790)
            {
                trace("删除自己");
                parent.removeChild(this);
                removeEventListener(Event.ENTER_FRAME, this.startMove);
            }
            x = x + this.speed;
            return;
        }// end function

        public function mouseDown() : void
        {
            addEventListener(MouseEvent.MOUSE_DOWN, this._mouseDown);
            removeEventListener(Event.ENTER_FRAME, this.startMove);
            return;
        }// end function

        private function _mouseDown(event:MouseEvent) : void
        {
            startDrag();
            return;
        }// end function

        private function stopMouseDown() : void
        {
            removeEventListener(MouseEvent.MOUSE_DOWN, this._mouseDown);
            return;
        }// end function

        public function mouseUp() : void
        {
            addEventListener(MouseEvent.MOUSE_UP, this._mouseUp);
            return;
        }// end function

        public function _onEnterFrame(event:Event)
        {
            if (currentFrame == 21)
            {
    //            Main.jifen = Main.jifen + 5;
				dispatchEvent(new UIEvent("score", 5));
                removeEventListener(Event.ENTER_FRAME, this._onEnterFrame);
                trace("加5分");
                parent.removeChild(this);
            }
            else if (currentFrame == 45)
            {
      //          Main.jifen = Main.jifen - 5;
	  dispatchEvent(new UIEvent("score", -5));
                removeEventListener(Event.ENTER_FRAME, this._onEnterFrame);
                trace("减5分");
                parent.removeChild(this);
            }
            else if (currentFrame == 70)
            {
 //               Main.jifen = Main.jifen - 10;
 dispatchEvent(new UIEvent("score", -10));
                removeEventListener(Event.ENTER_FRAME, this._onEnterFrame);
                trace("减10分");
                parent.removeChild(this);
            }
            return;
        }// end function

        private function _mouseUp(event:MouseEvent) : void
        {
            stopDrag();
            removeEventListener(Event.ENTER_FRAME, this.startMove);
            if (hitTestObject(this.b2))
            {
                this.speed = 0;
                gotoAndPlay(2);
                this.b2.gotoAndPlay(2);
                addEventListener(Event.ENTER_FRAME, this._onEnterFrame);
                trace("投递垃圾成功");
            }
            else if (hitTestObject(this.b1))
            {
                this.speed = 0;
                gotoAndPlay(22);
                this.b1.gotoAndPlay(31);
                addEventListener(Event.ENTER_FRAME, this._onEnterFrame);
                trace("投递错误");
            }
            else if (hitTestObject(this.b3))
            {
                this.speed = 0;
                this.b3.gotoAndPlay(31);
                gotoAndPlay(22);
                addEventListener(Event.ENTER_FRAME, this._onEnterFrame);
                trace("投递错误");
            }
            else if (y >= 30)
            {
                this.speed = 0;
                gotoAndPlay(46);
                addEventListener(Event.ENTER_FRAME, this._onEnterFrame);
                trace("投递错误");
            }
            return;
        }// end function

        private function stopMouseUp() : void
        {
            removeEventListener(MouseEvent.MOUSE_UP, this._mouseUp);
            return;
        }// end function

        function frame1()
        {
            stop();
            return;
        }// end function

        function frame21()
        {
            stop();
            return;
        }// end function

        function frame45()
        {
            stop();
            return;
        }// end function

        function frame70()
        {
            stop();
            return;
        }// end function

    }
}
