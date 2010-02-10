package cc.varga.utils.logger {

	/**
	 * @author Francis Varga
	 */
	public interface ILogger {		
		function log(message : String) : void;

		function warning(message : String) : void;

		function error(message : String) : void;

		function fatalError(message : String) : void;

		function debug(message : String) : void;
	}
}
