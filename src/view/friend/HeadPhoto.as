package view.friend 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	
	/**
	 * 头像加载
	 * @author mcko
	 */
	public class HeadPhoto extends Sprite
	{
		private var _imgLoader:Loader;
		
		//头像的背景框，通过此设置头像的大小、位置
		private var _imgContainerMC:DisplayObjectContainer; 
		
		public function HeadPhoto(_container_mc:DisplayObjectContainer) 
		{
			_imgContainerMC = _container_mc;
		}
		
		//加载头像
		public function loadPhoto(_img_url:String):void
		{
			if (_img_url == null || _img_url == "") return;
			
			_imgLoader = new Loader();
			_imgLoader.load(new URLRequest(_img_url));
			
			_imgLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, imgCompleteHandler);
			_imgLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,  imgErrorHandler);
		}
		
		protected function imgCompleteHandler(e:Event):void 
		{
			_imgLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, imgCompleteHandler);
			_imgLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, imgErrorHandler);
			_imgLoader.height =  _imgContainerMC.height;
			_imgLoader.width = _imgContainerMC.width;
			_imgContainerMC.addChild(_imgLoader);
		}
		
		//头像下载失败
		protected function imgErrorHandler(e:IOErrorEvent):void 
		{
			_imgLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, imgCompleteHandler);
			_imgLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, imgErrorHandler);
		}
		
	}
	
}