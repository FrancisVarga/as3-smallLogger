/*
 * 
 * <p><b>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++</b></p>
 * <p><b>version:</b> 0.0.1</p>
 * <p><b>author:</b> Francis Varga</p>
 * <p><b>eMail:</b> francis.varga[at]basilicom.de</p>
 * <p><b>create-date:Nov 20, 2010</b></p>
 * 
 * <p><b>homepage:</b><a href="http://www.basilicom.de">http://www.basilicom.de</a></p>
 * <p><b>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++</b></p>
 * 
 * <p><b>Modifiedlist:</b></p>
 *   <b>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++</b>
 *   <p>create: Francis Varga</p>
 *   <p>date:Nov 20, 2010</p> 
 *   <p>description:created class</p>
 *
 */
package cc.varga.couchdb
{
	import com.adobe.net.URI;

	import org.httpclient.HTTPClient;
	import org.httpclient.HTTPRequest;
	import org.httpclient.events.HTTPDataEvent;
	import org.httpclient.events.HTTPListener;
	import org.httpclient.events.HTTPRequestEvent;
	import org.httpclient.events.HTTPResponseEvent;
	import org.httpclient.events.HTTPStatusEvent;

	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;

	/**
	 * 
	 * Describe here your class
	 *
	 * @includeExample
	 * path to your example
	 *
	 */
	public class CouchDBClient extends EventDispatcher
	{		
		private static var _couchdbURI : URI;
		private static const APP_JSON : String = "application/json";
		private static var _httpClient : HTTPClient;

		public function CouchDBClient()
		{
			if(_httpClient == null) _httpClient = new HTTPClient();
			
			_httpClient.listener = new HTTPListener().
										setOnDataFunction(onData).
										setOnCloseFunction(onClose).
										setOnCompleteFunction(onComplete).
										setOnConnect(onConnect).
										setOnErrorFunction(onError).
										setOnRequestFunction(onRequest).
										setOnStatusFunction(onStatus);
		}

		private function onStatus(event : HTTPStatusEvent) : void
		{
			dispatchEvent(event);
		}

		private function onRequest(event : HTTPRequestEvent) : void
		{
			dispatchEvent(event);
		}

		private function onError(event : ErrorEvent) : void
		{
			dispatchEvent(event);
		}

		private function onConnect(event : HTTPRequestEvent) : void
		{
			dispatchEvent(event);
		}

		private function onComplete(event : HTTPResponseEvent) : void
		{
			dispatchEvent(event);
		}

		private function onClose(event : Event) : void
		{
			dispatchEvent(event);
		}

		private function onData(event : HTTPDataEvent) : void
		{
			dispatchEvent(event);
		}

		public function getRequest(dataToSend : ByteArray) : void
		{
			httpClient.request(couchdbURI, createHTTPReqeust('GET', dataToSend));
		}

		public function postRequest(dataToSend : ByteArray) : void
		{
			httpClient.post(couchdbURI, dataToSend, APP_JSON);
		}

		public function deleteRequest(deleteURL : String) : void
		{
			httpClient.del(new URI(deleteURL));
		}

		public function putRequest(dataToSend : ByteArray) : void
		{
			httpClient.put(couchdbURI, createHTTPReqeust('PUT', dataToSend));
		}
		
		private function createHTTPReqeust(method : String, bodyData : ByteArray):HTTPRequest
		{
			var request : HTTPRequest = new HTTPRequest(method);
			request.body = bodyData;
			return request;
		}
		
		public function get httpClient():HTTPClient
		{
			return _httpClient;
		}

		public function get couchdbURI() : URI
		{
			return _couchdbURI;
		}

		public function set couchdbURI(couchdbURI : URI) : void
		{
			_couchdbURI = couchdbURI;
		}

	}
}