package view 
{
	import com.utils.DebugTrace;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class Bg extends Sprite 
	{
		private var _url:String;
		private var loadingBar:LoadingBar;
		public function Bg() 
		{
			loadingBar = LoadingBar.getInstance();
		}
		private function loading(str:String):void {
			var loader:Loader = new Loader();
			loader.load(new URLRequest(str));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e:Event):void {
				DebugTrace.dtrace("code info Bg.as:下载完成。")
				addChild(loader);
				//trace(loader);//[object Loader]
				//trace(loader.contains);//function Function() {}
				//trace(loader.contentLoaderInfo);//[object LoaderInfo]
				//trace(loader.loaderInfo);//null
				//trace(loader.content);//[object Bitmap]
			})
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, function(e:ProgressEvent):void {
				loadingBar.loadingPre(e.bytesLoaded, e.bytesTotal);
			})
			loader.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS, function(e:HTTPStatusEvent):void {
				DebugTrace.dtrace("code info Bg.as:httpStatus---" + e);
			})
		}
		public function get url():String { return _url; }
		
		public function set url(value:String):void 
		{
			_url = value;
			addChild(loadingBar);
			loading(value);
		}
	}
	
}