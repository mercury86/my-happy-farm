package view 
{
	import data.vo.UserVO;
	import flash.display.MovieClip;
	import flash.text.TextField;
	/**
	 * 个人信息
	 * @author zhengzihua
	 */
	public class TopBar extends MovieClip
	{
		private var _userInfo:UserVO;
		public function TopBar() 
		{
			
		}
		
		public function get userInfo():UserVO { return _userInfo; }
		
		public function set userInfo(value:UserVO):void 
		{
			_userInfo = value;
			username.text = value.name;
			level.text = String(value.level);
			money.text = String(value.cash);
			credit.text = String(value.credit);
		}		
		
	}
	
}