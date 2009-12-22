package socket 
{
	import com.utils.DebugTrace;
	import flash.display.Sprite;
	import view.Field;
	import view.plant.PlantInstance;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class DealFarmInfo 
	{
		private static var instance:DealFarmInfo

		public function DealFarmInfo(singleton:SingletonFarm) 
		{
			
		}
		public static function getInstance():DealFarmInfo {
			if (instance == null) {
				instance=new DealFarmInfo(new SingletonFarm())
			}else {
				DebugTrace.dtrace("code info DealFarmInfo.as:已经实例化。")
			}
			return instance;
		}
		/**
		 * 对应10003
		 * 处理field
		 * @param	mainView
		 * @param	obj
		 */
		public function layoutFarm(obj:Object):void {
			var farmArr:Array = obj.farmlands;
			var num:int = farmArr.length;
			var mainView:MainView = MainView.getInstance();
			var plantContain:Sprite = mainView.plantContain;
			var fieldContain:Sprite = mainView.fieldContain;
			var expandX:int = obj.expandMc.x;
			var expandY:int = obj.expandMc.y;
			mainView.farmInit();//田地信息初始化
			mainView.expandMc.putMc(expandX, expandY);
			for (var i:int = 0; i < num; i++ ) {
				var farmObj:Object = farmArr[i];
				var row:int = farmObj.x;
				var cols:int = farmObj.y;
				var field:Field = mainView.fieldArr[row][cols];
				var plant:PlantInstance = mainView.plantLayout(plantContain, farmObj.plantId, row, cols, farmObj.growthStep);
				plant.plantName = "苹果树";
				plant.periodTime = 3600;
				mainView.landLayout(fieldContain, row, cols, farmObj.soilStatus);
			}
			
		}
		
	}
	
}
class SingletonFarm{}