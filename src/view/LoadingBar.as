package view 
{
	import com.utils.DebugTrace;
	import data.DataConst;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class LoadingBar extends Sprite
	{
		private static var instance:LoadingBar
		public function LoadingBar(singletonLoadingBar:SingletonLoadingBar) 
		{
			x = DataConst.LOADING_X;
			y = DataConst.LOADING_Y;
		}
		public static function getInstance():LoadingBar {
			if (instance == null) {
				instance = new LoadingBar(new SingletonLoadingBar());
			}else {
				DebugTrace.dtrace("code info LoadingBar.as:已经实例化。")
			}
			return instance;
		}
		/**
		 * 
		 * @param	loadedNum	下载完成的数据
		 * @param	totalNum	要下载的总数据
		 * @return
		 */
		public  function loadingPre(loadedNum:int, totalNum:int):int {
			var per:int = Math.floor(loadedNum / totalNum * 100);
			if (per == 100) {
				parent.removeChild(instance);
			}
			return per;
		}
		
	}
	
}
class SingletonLoadingBar{}