/*
 * 
 * <p><b>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++</b></p>
 * <p><b>version:</b> 0.0.1</p>
 * <p><b>author:</b> Francis Varga</p>
 * <p><b>eMail:</b> francis.varga[at]basilicom.de</p>
 * <p><b>create-date:Nov 23, 2010</b></p>
 * 
 * <p><b>homepage:</b><a href="http://www.basilicom.de">http://www.basilicom.de</a></p>
 * <p><b>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++</b></p>
 * 
 * <p><b>Modifiedlist:</b></p>
 *   <b>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++</b>
 *   <p>create: Francis Varga</p>
 *   <p>date:Nov 23, 2010</p> 
 *   <p>description:created class</p>
 *
 */
package cc.varga.couchdb.loggerapp.mvcs
{
	import org.robotlegs.mvcs.Context;
	import flash.display.DisplayObjectContainer;

	/**
	 * 
	 * Describe here your class
	 *
	 * @includeExample
	 * path to your example
	 *
	 */
	public class ApplicationContext extends Context
	{
		public function ApplicationContext(contextView : DisplayObjectContainer = null, autoStartup : Boolean = true)
		{
			super(contextView, autoStartup);
		}

		override public function startup() : void
		{
			mapCommands();
			mapMediators();
			mapInjections();
			
			super.startup();
		}
		
		private function mapCommands():void
		{
			
		}
		
		private function mapMediators():void
		{
			
		}
		
		private function mapInjections():void
		{
			
		}

	}
}
