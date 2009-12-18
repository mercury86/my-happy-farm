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
	 * 加载头像
	 * @author mcko
	 */
	public class HeadPhoto extends Sprite
	{
		private var _photoLoader:Loader;
		
		//头像的背景框，通过此设置头像的大小、位置
		private var _photoContainerMC:DisplayObjectContainer; 
	
		public function HeadPhoto(photo_container_mc:DisplayObjectContainer) 
		{
			_photoContainerMC = photo_container_mc;
		}
		
		//加载头像
		public function loadPhoto(_pic_url:String):void
		{
			if (_pic_url == null || _pic_url == "") return;
			_photoLoader = new Loader();
			_photoLoader.load(new URLRequest(_pic_url));
			_photoLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler);
			_photoLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onErrorHandler);
		}
		
		//头像下载完成后设置位置
		protected function onCompleteHandler(e:Event):void 
		{
			_photoLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onCompleteHandler);
			_photoLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onErrorHandler);
			
			var _mainContainer:Sprite = new Sprite();
			_mainContainer.addChild(_photoLoader);
			
			_photoLoader.x = _photoContainerMC.x + _photoContainerMC.width / 2;
			_photoLoader.y = _photoContainerMC.y + _photoContainerMC.height / 2;
			_photoLoader.x -= _photoLoader.width / 2;
			_photoLoader.y -= _photoLoader.height / 2;
			
			//为头像设置遮罩
			var maskSp:Sprite = new Sprite();
			maskSp.graphics.beginFill(0xFFFFFF);
			maskSp.graphics.drawRoundRect(_photoContainerMC.x + .5, _photoContainerMC.y + .5, 
									_photoContainerMC.width - 1.8, _photoContainerMC.height - 1.8,
									10, 10);
			_mainContainer.addChild(maskSp);
			_photoLoader.mask = maskSp;
			addChild(_mainContainer);
		}
		
		//头像下载失败
		protected function onErrorHandler(e:IOErrorEvent):void 
		{
			_photoLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onCompleteHandler);
			_photoLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onErrorHandler);
		}
		
	}
	
}