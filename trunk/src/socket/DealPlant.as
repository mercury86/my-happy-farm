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
			var mainView:MainView = MainView.getInstance();
			var plant:PlantInstance = mainView.plantArr[row][cols];
			return plant;
		}
		public function dealKillWorm(obj:Object):void {
			DebugTrace.dtrace("code info DealPlant.as:处理杀虫。");
			var plant:PlantInstance = appointPlant(obj);
			plant.killWorm();
		}
		public function dealPutWorm(obj:Object):void {
			DebugTrace.dtrace("code info DealPlant.as:处理放虫。");
			var plant:PlantInstance = appointPlant(obj);
			plant.putWorm();
		}
		public function dealReap(obj:Object):void {
			DebugTrace.dtrace("code info DealPlant.as:处理收割。");
			var plant:PlantInstance = appointPlant(obj);
			plant.reap();			
		}
	}
	
}
class SingletonPlant{}