package socket 
{
	import com.utils.DebugTrace;
	
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
		public function dealKillWorm(mainView:MainView,obj:Object):void {
			
		}
		public function dealPutWorm(mainView:MainView,obj:Object):void {
			
		}
		public function dealReap(mainView:MainView,obj:Object):void {
			
		}
	}
	
}
class SingletonPlant{}