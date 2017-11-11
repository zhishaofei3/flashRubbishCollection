package src.AS{

	import flash.events.Event;

	public class UIEvent extends Event {
		public function UIEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
			this.data = data;
		}

		private var _data:Object = {};

		public function get data():Object {
			return _data;
		}

		public function set data(data:Object):void {
			_data = data;
		}

		override public function toString():String {
			return formatToString("UIEVENT:", "type", "bubbles", "cancelable", "data");
		}

		override public function clone():Event {
			return new UIEvent(type, data, bubbles, cancelable);
		}
	}
}
