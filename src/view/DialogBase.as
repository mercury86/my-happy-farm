package view 
{
	import com.greensock.easing.Back;
	import com.greensock.TweenLite;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.ColorMatrixFilter;
	
	/**
	 * 用法：
	 * 1、main()方法作为程序的入口，根据情况需要override
	 * 2、addEventFun，添加事件监听器，根据情况override
	 * 3、removEvent()，remov事件监听器，根据情况override 
	 * 4、dispose()析构函数
	 * 5、onClose() 关闭窗体
	 * @author mcko
	 */
	public class DialogBase extends Sprite implements IDialogBase
	{
		/**
		 * 弹窗素材的名称，通过该名称加载素材
		 */
		public var dialogMcName:String = null;
		
		/**
		 * 弹窗素材对象的引用
		 */
		public var dialogMc:MovieClip = null;
		
		/**
		 * 弹窗是否显示关闭按钮,若显示关闭按钮，按钮名称 "close_btn",作为"dialogMc"的子出现
		 */
		public var showCloseBtn:Boolean = false;
		
		/**
		 * 模态标记
		 */
		public var isModal:Boolean = true;
		
		/**
		 * 点击关闭按钮触发的关闭事件名称
		 */
		public static const CLOSE_EVENT:String = "close_event";
		
		/**
		 * 弹窗后，是否对对其他显示对象添加滤镜
		 */
		public var _isFilter:Boolean = true;
		
		private var _container:Sprite = null;
		private var _stageChildStauts:Array = null;
		private var _stageChildBlurs:Array = null;
		
		private var _filterList:Array = new Array();
		private var _filter:ColorMatrixFilter = new ColorMatrixFilter([0.32715, 0.15235, 0.0205,
																		0, 31.75, 0.07715,
																		0.40235, 0.0205, 0,
																		31.75, 0.07715, 0.15235,
																		0.2705, 0, 31.75,
																		0, 0, 0, 1, 0]);
																		
																		
		public function DialogBase() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			onInitAsset();
			_filterList.push(_filter);
			
			//弹出窗体后是否和别的可交互对象可进行交互
			if(isModal)
				onForbidden();
			_container.alpha = 0;
			_container.scaleX = _container.scaleY = 0;
			
			stage.addChild(_container);//作为舞台的子显示出来，显示到最顶层
	
			TweenLite.to(_container, .9, {scaleX:1, scaleY:1,alpha:1, ease:Back.easeOut});
			
			//主程序入口
			this.main();
			
			//添加监听事件
			this.addEventFun();
		
		}
		
		private function onInitAsset():void
		{
			if (dialogMcName == null)
			{
				throw new Error("弹窗素材名称不能为空！");
				return;
			}
			
			dialogMc = GetMovieClip.getMovieClip(dialogMcName);
			if (_container == null)
				_container = new Sprite();
			_container.addChild(dialogMc);
			
			_container.x = stage.stageWidth / 2 - _container.width / 2;
			_container.y = stage.stageHeight/2 - _container.height / 2;
		}
		
		
		private function onForbidden():void
		{
			for (var i:int = 0; i < stage.numChildren; i++) 
			{
				var item:Sprite = Sprite(stage.getChildAt(i));
				
				if (_stageChildStauts == null)
					_stageChildStauts = new Array();
				_stageChildStauts.push(item.mouseChildren);
				
				if (_stageChildBlurs == null)
					_stageChildBlurs = new Array();
				_stageChildBlurs.push(item.filters);
				
				item.mouseChildren = false;
				
				if (_isFilter)
					item.filters = _filterList;
			}
		}
		
		//恢复被禁用的场景
		private function unlock():void
		{
			for (var i:int = 0; i < stage.numChildren; i++) 
			{
					var item:Sprite = Sprite(stage.getChildAt(i));
					if (i <this._stageChildStauts.length)
					{
						item.mouseChildren = _stageChildStauts[i];
						
						if (_isFilter)
							item.filters = _stageChildBlurs[i];
					}
				}
		}
		

		public function onClose(event:Event = null):void
		{
			removEvent();
			dispose();
		}
		
		
		/**
		 * 程序入口, 子类根据需求具体实现
		 */
		protected function main():void
		{
		}
		
		
		/**
		 * 添加事件, 子类根据需求具体实现
		 */
		protected function addEventFun():void
		{
			//若显示关闭按钮则添加侦听事件
			if(this.showCloseBtn)
				dialogMc.close_btn.addEventListener(MouseEvent.CLICK,onClose);
		}
		
		/**
		 * 删除所有事件, 子类根据需求具体实现
		 */
		protected function removEvent():void
		{
			if(this.showCloseBtn)
				dialogMc.close_btn.removeEventListener(MouseEvent.CLICK, onClose);
		}
		
		
		/**
		 *	窗口析构函数，释放内存, 子类根据需求具体实现
		 */
		protected function dispose():void
		{
			if(isModal)
				this.unlock();
				
			stage.removeChild(this._container);
			this.parent.removeChild(this);
		}
		
	}
}