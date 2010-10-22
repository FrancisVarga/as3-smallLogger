package cc.varga.utils.logger
{

    /**
     * 
     * @author 			Francis Varga // Aug 2, 2010 // cc.varga.utils.logger.LoggerJSONRPC
     *
     * @description 		<b>LoggerJSONRPC</b>
     *
     * @param 			
     * 					
     * @return 			    void
     * @example 			<code></code>
     *
     */
    public class LoggerJSONRPC extends Logger
    {
        public function LoggerJSONRPC (classPath : String = "")
        {
            super(classPath);
        }
         
        override protected function logOutput (message : String, type : String) : void
        {
            super.logOutput(message, type);
        }
    }
}
