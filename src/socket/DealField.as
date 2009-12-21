package socket 
{
	import com.utils.DebugTrace;
	import flash.display.Sprite;
	import view.ExpandMc;
	import view.Field;
	import view.FieldArea;
	import view.plant.PlantInstance;
	
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
			var mainView:MainView = MainView.getInstance();
			var field:Field = mainView.fieldArr[row][cols];
			return field;
		}
		/**对应30001
		 * 处理浇水
		 * @param	mainView
		 * @param	obj
		 */
		public function dealWatering(obj:Object):void {
			DebugTrace.dtrace("code info DealField.as:处理浇水。");
			var field:Field = appointField(obj);
			field.status = 2;
		}
		/**
		 * 30002
		 * @param	obj
		 */
		public function dealFertilize(obj:Object):void {
			DebugTrace.dtrace("code info DealField.as:处理施肥。");
			var field:Field = appointField(obj);
			field.status = 3;
		}
		/**
		 * 30003
		 * @param	obj
		 */
		public function dealKillWeed(obj:Object):void {
			DebugTrace.dtrace("code info DealField.as:处理除草。");
			var field:Field = appointField(obj);
			field.delWeed();
		}
		/**
		 * 30006
		 * @param	obj
		 */
		public function dealPutWeed(obj:Object):void {
			DebugTrace.dtrace("code info DealField.as:处理放草。");
			var field:Field = appointField(obj);
			field.addWeed();
		}
		/**
		 * 播种
		 * @param	mainView
		 * @param	obj
		 */
		public function dealSeed(obj:Object):void {
			
		}
		/**
		 * 挖掉
		 * @param	obj
		 */
		public function dealHoeing(obj:Object):void {
			var row:int = obj.x;
			var cols:int = obj.y;
			var mainView:MainView = MainView.getInstance();
			var fieldArea:FieldArea = mainView.fieldAreaArr[row][cols];
			fieldArea.delPlant();
			mainView.plantArr[row][cols] = null;
		}
		public function fieldStatus(obj:Object):void {
			var field:Field = appointField(obj);
			field.status = obj.soilType;
		}
		public function weedStatus(obj:Object):void {
			var field:Field = appointField(obj);
			field.weedStatus(obj.num);
		}
		public function dealExpand(obj:Object):void {
			var expandMc:ExpandMc = MainView.getInstance().expandMc;
			expandMc.putMc(obj.expandMc.x, obj.expandMc.y);
		}
	}
	
}
class SingletonField{}