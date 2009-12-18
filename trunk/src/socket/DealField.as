﻿package socket 
{
	import com.utils.DebugTrace;
	import flash.display.Sprite;
	import view.Field;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class DealField
	{
		private static var instance:DealField
		public function DealField(singleton:SingletonField) 
		{
			
		}
		public static function getInstance():DealField {
			if (instance == null) {
				instance=new DealField(new SingletonField())
			}else {
				DebugTrace.dtrace("code info DealWatering.as:已经实例化");
			}
			return instance;
		}
		private function appointField(obj:Object):Field {
			var row:int = obj.x;
			var cols:int = obj.y;
			var field:Field = mainView.fieldArr[row][cols];
			return field;
		}
		/**对应30001
		 * 处理浇水
		 * @param	mainView
		 * @param	obj
		 */
		public function dealWatering(mainView:MainView, obj:Object):void {
			DebugTrace.dtrace("code info DealField.as:处理浇水。");
			var field:Field = appointField(obj);
			field.status = 2;
		}
		public function dealFertilize(mainView:MainView, obj:Object):void {
			DebugTrace.dtrace("code info DealField.as:处理施肥。");
			var field:Field = appointField(obj);
			field.status = 3;
		}
		public function dealKillWeed(mainView:MainView, obj:Object):void {
			DebugTrace.dtrace("code info DealField.as:处理除草。");
		}
		public function dealPutWeed(mainView:MainView, obj:Object):void {
			DebugTrace.dtrace("code info DealField.as:处理放草。");
			
		}
		/**
		 * 播种
		 * @param	mainView
		 * @param	obj
		 */
		public function dealSeed(mainView:MainView, obj:Object):void {
			
		}
	}
	
}
class SingletonField{}