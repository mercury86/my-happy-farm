package view.friend
{
	import data.vo.UserVO;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import view.GetMovieClip;
	
	/**
	 * 好友显示信息
	 * @author mcko
	 */
	public class FriendView extends Sprite 
	{
		private var _mc:MovieClip;
		private var _user:UserVO;
		
		private var _index:int;
		private var _isSelected:Boolean=false;

		
		/**
		 * 构造函数 根据好友信息以及好友的排名初始化好友 依赖于 FriendUser对象
		 * @param	user  FriendUser 对象
		 * @param	index 排名
		 */
		public function FriendView(user:UserVO,index:int) 
		{
			_index = index;
			_user = user;
			if (stage) 
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event=null):void 
		{
			if (hasEventListener(Event.ADDED_TO_STAGE))
				removeEventListener(Event.ADDED_TO_STAGE, init);
			initView();
		}
		
		//视图处理
		private function initView():void
		{
			_mc = new MovieClip();
			_mc = GetMovieClip.getMovieClip("friend_mc");
			addChild(_mc);
			
			_mc.sort_txt.text = this._index + 1;
			_mc.level_mc.level_txt.text = _user.level;
			_mc.u_name_txt.text = _user.name;
		
			
			/*if (_user.sex == UserBase.MALE)
			{
				_mc.sex_mc.gotoAndStop(1);
				_mc.role_mc.gotoAndStop(1);
			}
			else
			{
				_mc.sex_mc.gotoAndStop(2);
				_mc.role_mc.gotoAndStop(2);
			}
			*/	
	
			var head_photo:HeadPhoto = new HeadPhoto(_mc.head_mc);
			head_photo.loadPhoto("1.jpg");
		}
		
		public function changBg(isSelected:Boolean):void
		{
			if (isSelected) 
				_mc.friendBg.gotoAndStop(2);
			else
				_mc.friendBg.gotoAndStop(1);
		}
		
		public function get mc():MovieClip { return _mc; }
		
		public function set mc(value:MovieClip):void 
		{
			_mc = value;
		}
		
		public function get user():UserVO { return _user; }
		
		public function set user(value:UserVO):void 
		{
			_user = value;
		}
		
	}
	
}