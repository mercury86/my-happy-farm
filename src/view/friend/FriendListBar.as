package view.friend
{
	import utils.StringUtil;
	import data.vo.UserVO;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import view.GetMovieClip;

	/**
	 * 猫扑开心农场好友列表显示对象
	 * 
	 * @author yjl
	 */
	public class FriendListBar extends Sprite
	{
       public static const UPDATE_OWER_INFO:String = "update_ower_info";//回家后定位到自己头像上
		
		public static const PAGESIZE:int = 8;//每页好友数量		
		private var _mc:MovieClip;
		private var _friendlist:Array;
		//做搜索
		private var _filterFriendlist:Array;
		
		private var _commonFriendListContainer:Sprite;//普通好友容器
		private var _currentSelectedUser:UserVO;//当前选中好友
		private var _commonFriendFirstIndex:int;
		
		/**
		 * 构造函数，对象的显示依赖于玩家 及玩家好友列表
		 * @param	friendlist  玩家好友列表
		 */
		public function FriendListBar(friendlist:Array) 
		{
			this._friendlist = friendlist;
			this._filterFriendlist = friendlist;
			
			if (this._friendlist !=null && this._friendlist.length >0)
				this._friendlist.sortOn("level", "experience",Array.NUMERIC | Array.DESCENDING);//根据经验对玩家列表排序
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}

		
		private function init(e:Event=null):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);

			_mc = GetMovieClip.getMovieClip("FriendBar");
			addChild(_mc);
			
			_commonFriendListContainer = new Sprite();
			addChild(_commonFriendListContainer);
			
			onControl();
			
			_currentSelectedUser = new UserVO();
			_currentSelectedUser.id = 85;
			var index:int = 15;// UserAssistant.findUserPositionFromListById(this._user, this._friendlist);
			displayFriendList(this._friendlist, index);
			//_mc.search_mc.user_searchText.addEventListener(Event.CHANGE,doSearch);
			
		}
		
		public function displayFriendList(friendlist:Array,selectedIndex:int):void
		{
			if (friendlist == null) return;
			if (selectedIndex<PAGESIZE)
				this._commonFriendFirstIndex = 0;
			else
				this._commonFriendFirstIndex = selectedIndex - PAGESIZE/2;
			this.showFriend(PAGESIZE);
		}
		
		private function doUpdateFriendInfo(e:Event):void 
		{
			//this.updateUserInfo(UserInfo.getInstance().myUser);
		}
		
		private function doTempClicK(e:MouseEvent):void 
		{
			//navigateToURL(new URLRequest(Global.global_addFriendURL),"_blank");
		}
		
		public function updateUserInfo(user:UserVO):void
		{
			/*if(_commonFriendListContainer != null && _commonFriendListContainer.numChildren >0)
			{
				for(var i:int = 0;i<_commonFriendListContainer.numChildren;i++)
				{
					var friend:Friend = _commonFriendListContainer.getChildAt(i) as Friend;
					if(friend == null || friend.user.userId != user.userId)continue;
			
					friend._mc.level_mc.level_txt.text = user.level;
					friend._mc.top_txt.text = user.exp;	
				}
			}*/
		}
		
		private function doRefresh():void
		{	
		}
		
		private function friendListDataLoaded(evt:Event):void 
		{
			
		}
		
		
		private function setSelfSelected(e:Event):void
		{
			/*this.moveAdvanceFriendList();
			this.moveCommonFriendList();
			var index:int = UserAssistant.findUserPositionFromListById(UserInfo.getInstance().myUser,this._filterFriendlist);
			displayFriendList(this._friendlist, index);
			updateUserInfo(UserInfo.getInstance().myUser);*/
		}
		
		//取消用户选中时的状态
		private function removeAllFriendSelectState():void
		{
			for (var j:int = 0; j < this._commonFriendListContainer.numChildren; j++)
			{
				var friend:FriendView = this._commonFriendListContainer.getChildAt(j) as  FriendView;
				friend.changBg(false);
			}
		}
		
		
		//单击用户监听器
		private function onfriendClickhandler(e:Event):void 
		{
			var friend:FriendView = FriendView(e.target);
			if (friend == null)
			{
				//navigateToURL(URLRequest(),"_blank");
				return ;
			}
			
			if ((this._currentSelectedUser != null) && (friend.user.id == this._currentSelectedUser.id)) return;
			this.removeAllFriendSelectState();
			
			friend.mc.friendBg.gotoAndStop(2);
			this._currentSelectedUser = friend.user;
		}
	
		
		private function onControl():void
		{
			_mc.groupUp_btn.addEventListener(MouseEvent.CLICK, clickHandler);
			_mc.groupDwon_btn.addEventListener(MouseEvent.CLICK, clickHandler);
			_mc.frist_btn.addEventListener(MouseEvent.CLICK, clickHandler);
			_mc.last_btn.addEventListener(MouseEvent.CLICK, clickHandler);
			_mc.refresh_btn.addEventListener(MouseEvent.CLICK, clickHandler);
			_mc.search_mc.user_search_btn.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		private function clickHandler(e:MouseEvent):void 
		{
			var btn:SimpleButton = SimpleButton(e.target);
			switch(btn.name)
			{
				case "groupUp_btn":
					doBackwards(PAGESIZE);
					break;
				//下一页好友
				case "groupDwon_btn":
					doAhead(PAGESIZE);
					break;
				//第一页好友
				case "frist_btn":
					doFristPageFriend();
					break;
				//最后一页好友
				case "last_btn":
					doEndPageFriend();
					break;
					
				//刷新好友
				case "refresh_btn":
					doRefresh();
					break;
				case "user_search_btn":
					doSearch();
					break;
			}
		}
		
		//用户过滤
		private function  doSearch(event:Event = null):void
		{
			if (_mc.search_mc.user_search_txt.text == null || StringUtil.trim(_mc.search_mc.user_search_txt.text) == "") 
				_filterFriendlist = this._friendlist;
			else
				_filterFriendlist = this._friendlist.filter(filterFriendList);
			this.moveCommonFriendList();
			
			var index:int = UserAssistant.findUserPositionFromListById(this._currentSelectedUser,this._filterFriendlist);
			this.displayFriendList(_filterFriendlist,index);
		}
		
		private function filterFriendList(item:*, index:int, array:Array):Boolean
		{
			if (item.name == null) return false;
			if (item.name.indexOf(_mc.search_mc.user_search_txt.text) >= 0) 
				return true;
			else
				return  false;
			
		}
	
		private function moveCommonFriendList():void
		{
			for (var i:int = 0; i < this._commonFriendListContainer.numChildren; i++)
			{
				var frind:FriendView = this._commonFriendListContainer.getChildAt(i) as FriendView;
				if (frind.hasEventListener(MouseEvent.CLICK))
					frind.removeEventListener(MouseEvent.CLICK, onfriendClickhandler);
				this._commonFriendListContainer.removeChildAt(i);
				i--;	
			}
		}
		
		private function doEndPageFriend():void
		{
			if (this._commonFriendFirstIndex + PAGESIZE > this._filterFriendlist.length - 1) return;
			if ((this._filterFriendlist.length - 1 - PAGESIZE) > 0)
				this._commonFriendFirstIndex = (this._filterFriendlist.length - PAGESIZE);
			showFriend(PAGESIZE);
		}
		
		private function doFristPageFriend():void
		{
			if (this._commonFriendFirstIndex == 0) return;
			this._commonFriendFirstIndex = 0;
			showFriend(PAGESIZE);
		}
		
		private function doBackwards(step:int):void
		{
			if (this._commonFriendFirstIndex <= 0) return;
			if (this._commonFriendFirstIndex - step <= 0) 
				this._commonFriendFirstIndex = 0;
			else
				this._commonFriendFirstIndex = (this._commonFriendFirstIndex - step);
			showFriend(step);
		}
	
		private function doAhead(step:int):void
		{
			if ((this._commonFriendFirstIndex + PAGESIZE) > this._friendlist .length -1) return;
			this._commonFriendFirstIndex = (this._commonFriendFirstIndex + step) ;
			showFriend(step);
		}
		
		private function showFriend(step:int):void
		{
			var count:int;
			moveCommonFriendList();
			for (var i:uint = _commonFriendFirstIndex; i < this._filterFriendlist.length; i++) 
			{
				var tmp:FriendView = new FriendView(this._filterFriendlist[i],i);
				this._commonFriendListContainer.addChild(tmp);
				tmp.addEventListener(MouseEvent.CLICK, onfriendClickhandler);
				
				if(count == 0)
					tmp.x = 52;
				else
					tmp.x = count * 85 + 52;
				count ++;
				
				tmp.buttonMode = true;
				tmp.mouseChildren = false;
				
				if (this._currentSelectedUser != null && this._currentSelectedUser.id == tmp.user.id)
					tmp.changBg(true);
				if (count == PAGESIZE) break;
			}	
		}
		
		private function dipose():void
		{	
			//_mc.search_mc.user_searchText.removeEventListener(Event.CHANGE,doSearch);
		}
		
	}
	
}