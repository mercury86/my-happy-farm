package socket 
{
	import com.utils.DebugTrace;
	import flash.display.MovieClip;
	
	/**
	 * 处理用户信息
	 * @author zhengzihua
	 */
	public class DealUserInfo 
	{
		public static var userName:String;
		public static var userLevel:int;
		public static var userImg:String;
		public static var userExp:int;
		public static var userNextExp:int;
		public static var userCash:int;
		public static var userKool:int;
		public static var userCredit:int;
		public static var userBackGround:int;//背景id
		public static var userDog:int;//-1表示没有狗狗，数值表示狗狗id
		
		private static var topBar:MovieClip;
		public function DealUserInfo() 
		{
			
		}
		public static function dealUserInfo(mainView:MainView, obj:Object):void {
			DebugTrace.dtrace("code info DealUserInfo.as:处理用户信息。")
			topBar = mainView.topBar as MovieClip;
			
			trace(obj.name)
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