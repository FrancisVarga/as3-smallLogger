package cc.varga.utils.logger
{
    import flash.utils.getTimer;
	

	/**
	 * @author Francis Varga
	 */
	public class Logger implements ILogger {

		private static const LOG : String = "LOG";
		private static const WARNING : String = "WARNING";
		private static const ERROR : String = "ERROR";
		private static const FATAL_ERROR : String = "FATAL_ERROR";
		private static const DEBUG : String = "DEBUG";
		private static const TEMP : String = "TEMP";

		private var _classPath : String;

		public function Logger(classPath : String = "") {
			classPath = classPath;
		}

		public function log(message : String) : void {
			output(message, Logger.LOG);
		}

		public function warning(message : String) : void {
			output(message, Logger.WARNING);
		}

		public function error(message : String) : void {
			output(message, Logger.ERROR);			
		}

		public function fatalError(message : String) : void {
			output(message, Logger.FATAL_ERROR);
		}

		public function debug(message : String) : void {
			output(message, Logger.DEBUG);
		}
		
		public function temp(message : String) : void {
			output(message, Logger.TEMP);
		}

		public function output(type : String, message : String, folding : Boolean = false, title : String = "HERE IS YOUR FUCKING TITLE", line : uint = 0, reaseon : String = "To lazy for a reason!!!") : void
		{
			var output : String = "[" + getTimer() + "].[" + type + "].[" + _classPath + "] -> " + message;
			trace(output);
		}

		public function set classPath(value : String) : void
		{
			_classPath = value;
		}
	}
}