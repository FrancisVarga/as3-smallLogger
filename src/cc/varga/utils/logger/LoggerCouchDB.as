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
package cc.varga.utils.logger
{
	import cc.varga.couchdb.CouchDBClient;

	import com.maccherone.json.JSON;

	import mx.core.FlexGlobals;

	import flash.utils.ByteArray;

	/**
	 * 
	 * Describe here your class
	 *
	 * @includeExample
	 * path to your example
	 *
	 */
	public class LoggerCouchDB extends LoggerSOS
	{
		private var _client : CouchDBClient;
		private var _classPath : String;

		public function LoggerCouchDB(classPath : String = "")
		{
			super(classPath);
			_client = new CouchDBClient();
		}

		override public function output(type : String, message : String, folding : Boolean = false, title : String = "HERE IS YOUR FUCKING TITLE", line : uint = 0, reason : String = "To lazy for a reason!!!") : void
		{
			var domain : String = FlexGlobals.topLevelApplication['loaderInfo']['url'];

			var output : Object = {"type":type, "classPath":_classPath, "title":title, message:message, "domain":domain, "line":line, "stacktrace":null, "reason":reason};
			var outPutJSONString : String = JSON.encode(output);
			var outputByteArray : ByteArray = new ByteArray();
			outputByteArray.writeUTFBytes(outPutJSONString);

			_client.postRequest(outputByteArray);
		}

		override public function set classPath(value : String) : void
		{
			super.classPath = value;
		}
	}
}
