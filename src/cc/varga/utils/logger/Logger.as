package cc.varga.utils.logger
{
	import flash.utils.getTimer;

	/**
	 * @author Francis Varga
	 */
	public class Logger implements ILogger
	{
		private static const LOG : String = "LOG";
		private static const WARNING : String = "WARNING";
		private static const ERROR : String = "ERROR";
		private static const FATAL_ERROR : String = "FATAL_ERROR";
		private static const DEBUG : String = "DEBUG";
		private static const TEMP : String = "TEMP";
		public var _classPath : String;

		public function Logger(classPath : String = "")
		{
			_classPath = classPath;
		}

		public function log(message : String) : void
		{
			logOutput(message, Logger.LOG);
		}

		public function warning(message : String) : void
		{
			logOutput(message, Logger.WARNING);
		}

		public function error(message : String) : void
		{
			logOutput(message, Logger.ERROR);
		}

		public function fatalError(message : String) : void
		{
			logOutput(message, Logger.FATAL_ERROR);
		}

		public function debug(message : String) : void
		{
			logOutput(message, Logger.DEBUG);
		}

		public function temp(message : String) : void
		{
			logOutput(message, Logger.TEMP);
		}

		protected function logOutput(message : String, type : String) : void
		{
			var output : String = "[" + getTimer() + "].[" + type + "].[" + _classPath + "] -> " + message;
			trace(output);
		}

		public function set logLevel(value : uint) : void
		{
		}
	}
}