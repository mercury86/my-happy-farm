package view 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class FriendBar extends MovieClip
	{
		private var _currentShow:int;//标识当前最左边显示的friend
		private var pageShowTotalNum:int;//每页显示多少个朋友
		private var friendList:Array;
		public function FriendBar(cx:int,cy:int) 
		{
			currentShow = 0;
			pageShowTotalNum = 8;
			x = cx;
			y = cy;
		}
		/**
		 * 显示好友列表
		 * @param	list	好友列表
		 */
		public function showFriendList(list:Array):void {
			friendList = list;
			
		}
		public function nextF():void {
			currentShow++
		}
		public function nextPageF():void {
			
		}
		public function prevF():void {
			currentShow--
		}
		public function prevPageF():void {
			
		}
		
		public function get currentShow():int { return _currentShow; }
		
		public function set currentShow(value:int):void 
		{
			_currentShow = value;
		}
		
		
	}
	
}