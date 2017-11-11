package src.AS
{
    import flash.display.*;

    public class box3 extends MovieClip
    {

        public function box3()
        {
            addFrameScript(0, this.frame1, 29, this.frame30, 54, this.frame55);
            this.setUpLocation();
            return;
        }// end function

        private function setUpLocation() : void
        {
            x = 100;
            y = 300;
            return;
        }// end function

        function frame1()
        {
            stop();
            return;
        }// end function

        function frame30()
        {
            gotoAndStop(1);
            return;
        }// end function

        function frame55()
        {
            gotoAndStop(1);
            return;
        }// end function

    }
}
