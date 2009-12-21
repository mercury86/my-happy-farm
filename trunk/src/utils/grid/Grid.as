package utils.grid 
{
	import data.vo.GridDataDispVO;
	import flash.geom.Rectangle;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import view.GetMovieClip;
	
	/**
	 * 网格
	 * @author mcko
	 */
	public class Grid extends Sprite
	{
		
		//列数
		public var colNum:int = 5;
		
		//行间距
		public var rowDist:int = 0;
		//列间距
		public var colDist:int = 10;
		
		private var _verticalScrollBar_mc:MovieClip;
		
		//数据集
		public var dataProvider:Array;
		
		private var _showWidth:Number = 0;
		private var _showHeigh:Number = 0;
		private var _container:Sprite = new Sprite();
		private var _rowHight:Number = 0;
		
		public function Grid(showWidth:Number,showHeigh:Number) 
		{
			_showWidth = showWidth;
			_showHeigh = showHeigh;
			this.addChild(_container);
			setMask();
		}
		
		private function createChild():void
		{
			if (dataProvider == null || dataProvider.length == 0) return;
			
			var y:int = 0;
			var x:int = 0;
			var showVerticalScrollBar:Boolean;
			for (var i:int = 0; i < dataProvider.length; i++ )
			{
				var tempVO:GridDataDispVO = dataProvider[i] as GridDataDispVO;
				var itemView:GridItem = new GridItem(tempVO);
				
				//记住单列的高度
				if (_rowHight == 0)
					_rowHight = tempVO.item_bg_mc.height + this._rowHight;
				
				itemView.buttonMode = true;
				
				if(i % this.colNum != 0)
					x += tempVO.item_bg_mc.width + this.colDist;
				_container.addChild(itemView);
				
				tempVO.item_bg_mc.y = y;
				tempVO.item_bg_mc.x = x;
				
				if ((i + 1) % this.colNum != 0) continue;
				y += tempVO.item_bg_mc.height + this.rowDist;
				x = 0;
				if(showVerticalScrollBar == true)continue;
				
				if((y+tempVO.item_bg_mc.height)> _showHeigh)
					showVerticalScrollBar = createVerticalScrollBar();
	
			}
		}
		
		private function createVerticalScrollBar():Boolean
		{
			_verticalScrollBar_mc = GetMovieClip.getMovieClip("verticalScrollBar_mc");
			_verticalScrollBar_mc.height = this._showHeigh;
			_verticalScrollBar_mc.x = _showWidth - 150;
			_verticalScrollBar_mc.y = this._showHeigh/2;
			this.addChild(_verticalScrollBar_mc);
			
			_verticalScrollBar_mc.scroll_drop_mc.addEventListener(MouseEvent.MOUSE_OUT, onScrollDrag);
			_verticalScrollBar_mc.scroll_drop_mc.addEventListener(MouseEvent.MOUSE_DOWN, onScrollDrag);
			_verticalScrollBar_mc.scroll_drop_mc.addEventListener(MouseEvent.MOUSE_UP, onScrollDrag);
			_verticalScrollBar_mc.scroll_drop_mc.addEventListener(MouseEvent.MOUSE_MOVE, onScrollDrag);
			
			_verticalScrollBar_mc.scroll_up_btn.addEventListener(MouseEvent.CLICK, onScrollUp);
			_verticalScrollBar_mc.scroll_down_btn.addEventListener(MouseEvent.CLICK, onScrollDown);
			
			return true;
		}
		
		private function onScrollUp(e:Event):void
		{
			if (_verticalScrollBar_mc.scroll_drop_mc.y  - ((this._rowHight/this._container.height) * _verticalScrollBar_mc.scroll_line_mc.height) < - _verticalScrollBar_mc.scroll_line_mc.height/2)
			{
				_verticalScrollBar_mc.scroll_drop_mc.y = - _verticalScrollBar_mc.scroll_line_mc.height/2;
				this.verticalScroll(0);
				return;
			}	
			
			_verticalScrollBar_mc.scroll_drop_mc.y -= ((this._rowHight/this._container.height) * _verticalScrollBar_mc.scroll_line_mc.height);
			verticalScroll((_verticalScrollBar_mc.scroll_drop_mc.y + _verticalScrollBar_mc.scroll_line_mc.height/2)/_verticalScrollBar_mc.scroll_line_mc.height);
		}
		
		
		//滚动条向下滚
		private function onScrollDown(e:Event):void
		{
			if (_verticalScrollBar_mc.scroll_drop_mc.y  + ((this._rowHight/this._container.height) * _verticalScrollBar_mc.scroll_line_mc.height) > _verticalScrollBar_mc.scroll_line_mc.height/2)
			{
				_verticalScrollBar_mc.scroll_drop_mc.y = _verticalScrollBar_mc.scroll_line_mc.height/2;;
				this.verticalScroll(1);
				return;
			}	
			
			_verticalScrollBar_mc.scroll_drop_mc.y += ((this._rowHight/this._container.height) * _verticalScrollBar_mc.scroll_line_mc.height);
			verticalScroll((_verticalScrollBar_mc.scroll_drop_mc.y + _verticalScrollBar_mc.scroll_line_mc.height/2)/_verticalScrollBar_mc.scroll_line_mc.height);
		}
		
		private var drag_mcMouseDown:Boolean;
		
		//滚动条滚动数据处理
		private function onScrollDrag(event:MouseEvent):void
		{	
			var drag_mc:MovieClip = MovieClip(event.currentTarget);
			
			if (event.type == MouseEvent.MOUSE_DOWN)
			{
				drag_mcMouseDown = true;
				drag_mc.startDrag(false,new Rectangle(0,-_verticalScrollBar_mc.scroll_line_mc.height/2,0.1,_verticalScrollBar_mc.scroll_line_mc.height));
			}
				
			if (event.type == MouseEvent.MOUSE_UP || event.type == MouseEvent.MOUSE_OUT)
			{
				drag_mcMouseDown = false;
				drag_mc.stopDrag();
			}	
				
			if (event.type == MouseEvent.MOUSE_MOVE && drag_mcMouseDown)
			{
				verticalScroll((drag_mc.y + _verticalScrollBar_mc.scroll_line_mc.height/2)/_verticalScrollBar_mc.scroll_line_mc.height);
			}
		}
		
		private function verticalScroll(position:Number):void
		{
			this._container.y = ((this._showHeigh - this._container.height) * position);
		}
		
		private function setMask():void
		{
			//为头像设置遮罩
			var mask:Sprite = new Sprite();
			mask.graphics.beginFill(0xFFFFFF);
			mask.graphics.drawRect(0,0,this._showWidth,this._showHeigh);
			this.addChild(mask);
			this.mask = mask;
		}
	
		
		public function validateNow():void
		{
			dispose();
			createChild();
		}
		
		
		public function dispose():void
		{
			if (_verticalScrollBar_mc != null && this.contains(this._verticalScrollBar_mc))
				 this.removeChild(_verticalScrollBar_mc);
			
			if(this._container == null || this._container.numChildren == 0)return;
			while(this._container.numChildren > 0)
			{
				var gridItem:GridItem = this._container.getChildAt(0) as GridItem;
				this._container.removeChildAt(0);
				var i:int;
				trace(i++);
			}
		}
		
	}
}