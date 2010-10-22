package cc.varga.utils.logger {
	import com.maccherone.json.JSON;

	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.XMLSocket;
	import flash.utils.getTimer;

	/**
	 * @author Francis Varga
	 */
	public class LoggerSOS implements ILogger {
		private static var socket : XMLSocket;
		public var _classPath : String;
		public static var CONNECT_TO_SOCKET : Boolean = false;
		public static var enableTrace : Boolean = false;

		public function LoggerSOS(classPath : String = "") {
			_classPath = classPath;
			init();
		}

		public static function init() : void {
			if(socket == null && CONNECT_TO_SOCKET == true) {
				trace("First Connect to SOSMax");

				socket = new XMLSocket;
				socket.addEventListener(Event.CONNECT, onConnect);
				socket.addEventListener(IOErrorEvent.IO_ERROR, onError);
				socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);

				socket.connect("localhost", 4444);
			}
		}

		private static function onError(event : *) : void {
			trace("Error => " + event);
		}

		private static function onConnect(event : Event) : void {
			trace("Connect => " + event);
		}

		public function log(message : String) : void {
			output("TRACE", message);
		}

		public function warning(message : String) : void {
			output("WARNING", message);
		}

		public function error(message : String) : void {
			output("ERROR", message);
		}

		public function fatalError(message : String) : void {
			output("FATALERROR", message);
		}

		public function debug(message : String) : void {
			output("Debug", message);
		}

		public function customOutput(customType : String, message : String) : void {
			output(customType, message);
		}

		public function jsonStringPrettyOutput(jsonString : String) : void {
			var jsonObject : Object = JSON.decode(String(jsonString));
			jsonObjectPrettyOutput(jsonObject);
		}

		public function jsonObjectPrettyOutput(jsonObj : Object) : void {
			output("PRETTY_JSON_OUTPUT", JSON.encode(jsonObj, true, 40), true);
		}

		public function temp(message : String):void {
			output("TEMP", message);
		}

		protected function output(type : String, message : String, folding : Boolean = false, title : String = "HERE IS YOUR FUCKING TITLE") : void {
			if(enableTrace == true) {
				var output : String = "[" + getTimer() + "].[" + type + "].[" + _classPath + "] -> " + message;

				trace(output);
			}

			try {
				if(CONNECT_TO_SOCKET == true) {
					if(folding == true) {
						socket.send("!SOS<showFoldMessage key='" + type + "'>" + "<title>" + title + " // " + getTimer() + "</title>" + "<message>" + message + "</message>" + "</showFoldMessage>");
					} else {
						socket.send("!SOS<showMessage key='" + type + "'>" + getTimer() + " // " + _classPath + " => " + message + "</showMessage>\n");
					}
				}
			} catch(error : Error) {
			}
		}

		public function set logLevel(value : uint) : void
		{
		}
	}
}
