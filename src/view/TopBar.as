package view 
{
	import com.utils.ProgressDisplay;
	import data.vo.UserVO;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	import view.friend.HeadPhoto;
	/**
	 * 个人信息
	 * @author zhengzihua
	 */
	public class TopBar extends MovieClip
	{
		private var _userInfo:UserVO;
		private var perMc:ProgressDisplay;
		public function TopBar() 
		{
			var perTop:PerTopMc = new PerTopMc();
			var perBehindMc:PerBehindMc = new PerBehindMc();
			perTop.stop();
			perMc = new ProgressDisplay(perTop, perBehindMc);
			perMc.x = 67;
			perMc.y = 24;
			addChild(perMc);
		}
		private function loadPhoto(url:String):void {
			var photoLoad:HeadPhoto = new HeadPhoto(head_mc);
			photoLoad.loadPhoto(url);
		}
		public function get userInfo():UserVO { return _userInfo; }
		
		public function set userInfo(value:UserVO):void 
		{
			_userInfo = value;
			username.text = value.name;
			level.text = String(value.level);
			money.text = String(value.cash);
			credit.text = String(value.credit);
			perMc.displayProgress(value.experience, value.nextExperience);
			loadPhoto(value.headUrl);
		}		
		
	}
	
}