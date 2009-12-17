package view 
{
	import com.event.EventZheng;
	import com.utils.DebugTrace;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.Stage;
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
		private var loadingBar:LoadingBar;
		public function Bg() 
		{
		}
		public function loadBg(parentMc:Stage,loadingBar:LoadingBar,url:String):void {
			loading(url);
			this.loadingBar = loadingBar;
			parentMc.addChild(loadingBar);
		}
		private function loading(str:String):void {
			var loader:Loader = new Loader();
			loader.load(new URLRequest(str));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e:Event):void {
				DebugTrace.dtrace("code info Bg.as:下载完成。")
				addChild(loader);
				loadingBar.delThis();
				loader.x = -(loader.width - stage.stageWidth) * 0.5;
				loader.y = -(loader.height - stage.stageHeight) * 0.5;
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
	}
	
}