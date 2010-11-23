package cc.varga.utils.logger
{
	/**
	 * @author Francis Varga
	 */
	public interface ILogger
	{
		function log(message : String) : void;

		function warning(message : String) : void;

		function error(message : String) : void;

		function fatalError(message : String) : void;

		function debug(message : String) : void;

		function temp(message : String) : void;
		
		function output(type : String, message : String, folding : Boolean = false, title : String = "HERE IS YOUR FUCKING TITLE", line : uint = 0, reaseon : String = "To lazy for a reason!!!"):void
		
		function set classPath(value : String):void
		
	}
}
