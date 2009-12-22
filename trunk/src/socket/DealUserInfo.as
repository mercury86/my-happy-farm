package socket 
{
	import com.utils.DebugTrace;
	import data.vo.ParseUser;
	import data.vo.UserVO;
	import flash.display.MovieClip;
	import view.TopBar;
	
	/**
	 * 处理用户信息
	 * @author zhengzihua
	 */
	public class DealUserInfo 
	{
		/**
		 * 用户信息
		 */
		public static var MyInfo:UserVO = new UserVO();
		/**
		 * 上工具栏
		 */
		private var topBar:TopBar;
		private static var instance:DealUserInfo
		public function DealUserInfo(singleton:SingletonUser) 
		{
			
		}
		public static function getInstance():DealUserInfo {
			if (instance == null) {
				instance=new DealUserInfo(new SingletonUser())
			}else {
				DebugTrace.dtrace("code info DealUserInfo.as:已经实例化。")
			}
			return instance;
		}
		public function dealUserInfo(obj:Object):void {
			DebugTrace.dtrace("code info DealUserInfo.as:处理用户信息。")
			var mainView:MainView = MainView.getInstance();
			var parseUser:ParseUser = ParseUser.getInstance();
			var userVo:UserVO = parseUser.parseUserDtoToVo(obj.user);
			topBar = mainView.topBar as TopBar;
			topBar.userInfo = userVo;
		}
		
	}
	
}
class SingletonUser{}