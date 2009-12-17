package socket 
{
	import com.utils.DebugTrace;
	import data.vo.UserVO;
	import flash.display.MovieClip;
	
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
		private var topBar:MovieClip;
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
		public function dealUserInfo(mainView:MainView, obj:Object):void {
			DebugTrace.dtrace("code info DealUserInfo.as:处理用户信息。")
			topBar = mainView.topBar as MovieClip;
			//设置myInfo属性
			//userName = obj.name;
			//topBar.level.text=userLevel = obj.level;
			//userImg = obj.img;
			//userExp = obj.experience;
			//userNextExp = obj.next_experience;
			//userCash = obj.cash;
			//userKool = obj.kool;
			//userCredit = obj.credit;
			//userBackGround = obj.backGround;
			//userDog = obj.dog;
		}
		
	}
	
}
class SingletonUser{}