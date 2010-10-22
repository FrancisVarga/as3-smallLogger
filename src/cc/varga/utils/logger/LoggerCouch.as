package cc.varga.utils.logger
{

    /**
     * 
     * @author 			Francis Varga // Aug 2, 2010 // cc.varga.utils.logger.LoggerCouch
     *
     * @description 		<b>LoggerCouch</b>
     *
     * @param 			
     * 					
     * @return 			    void
     * @example 			<code></code>
     *
     */
    public class LoggerCouch extends Logger
    {
        public function LoggerCouch (classPath : String = "")
        {
            super(classPath);
        }
         
        override protected function logOutput (message : String, type : String) : void
        {
            
        }
    }
}
