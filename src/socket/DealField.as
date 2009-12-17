package socket 
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
		/**
		 * 处理浇水
		 * @param	mainView
		 * @param	obj
		 */
		public function dealWatering(mainView:MainView, obj:Object):void {
			DebugTrace.dtrace("code info DealWatering.as:处理浇水。");
			var fieldContain:Sprite =mainView.fieldContain;
			var status:int = obj.status;
			var row:int = obj.x;
			var cols:int = obj.y;
			var field:Field = fieldContain.getChildByName("f" + row + "_" + cols) as Field;
			if (status==1) {
				field.status = 2;
			}else if (status == 0) {
				DebugTrace.dtrace("code error DealWatering.as:不需要浇水。");
			}else {
				DebugTrace.dtrace("code error DealWatering.as:浇水失败。");
			}
		}
		public function dealFertilize(mainView:MainView,obj:Object):void {
			
		}
		public function dealKillWeed(mainView:MainView, obj:Object):void {
			
		}
		public function dealPutWeed(mainView:MainView, obj:Object):void {
			
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