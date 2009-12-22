package view 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class FarmContain extends Sprite
	{
		private var _objArr:Array=[];
		public function FarmContain() 
		{
		}
		override public function addChild(child:DisplayObject):DisplayObject {
			super.addChild(child);
			objArr.push(child);
			sortOnUpdate();
			return child;		
		}
		override public function removeChild(child:DisplayObject):DisplayObject {
			super.removeChild(child);
			var num:int = objArr.length;
			for (var i:int; i < num; i++ ) {
				var arr:DisplayObject = objArr[i] as DisplayObject;
				if (arr.name == child.name) {
					return  objArr.splice(i, 1) as DisplayObject;			
				}
			}
			return child;
		}
		private function sortOnUpdate():void {
			var num:int = objArr.length;
			if(num>1)objArr.sortOn("y", Array.NUMERIC);
			for (var i:int = 0; i < num && num > 1; i++ ) {
				var mc:Sprite = objArr[i] as Sprite;
				setChildIndex(mc, i);
			}
		}
		
		public function get objArr():Array { return _objArr; }
		
		public function set objArr(value:Array):void 
		{
			_objArr = value;
		}
		
	}
	
}