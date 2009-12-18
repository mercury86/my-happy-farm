package socket 
{
	import com.utils.DebugTrace;
	import view.plant.PlantInstance;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class DealPlant 
	{
		private static var instance:DealPlant;
		public function DealPlant(singleton:SingletonPlant) 
		{
			
		}
		public static function getInstance():DealPlant {
			if (instance == null) {
				instance=new DealPlant(new SingletonPlant())
			}else {
				DebugTrace.dtrace("code info DealPlant.as:已经实例化。")
			}
			return instance;
		}
		private function appointPlant(obj:Object):PlantInstance {
			var row:int = obj.x;
			var cols:int = obj.y;
			var plant:PlantInstance = mainView.plantArr[row][cols];
			return plant;
		}
		public function dealKillWorm(mainView:MainView,obj:Object):void {
			DebugTrace.dtrace("code info DealPlant.as:处理杀虫。");
			var plant:PlantInstance = appointPlant(obj);	
		}
		public function dealPutWorm(mainView:MainView,obj:Object):void {
			DebugTrace.dtrace("code info DealPlant.as:处理放虫。");
		}
		public function dealReap(mainView:MainView, obj:Object):void {
			DebugTrace.dtrace("code info DealPlant.as:处理收割。");
			
		}
	}
	
}
class SingletonPlant{}