package view.friend 
{
	import data.vo.UserVO;
	/**
	 * ...
	 * @author mcko
	 */
	public class FriendsProxy
	{
		private static var _instance:FriendsProxy; 
		
		
		private var _friendList:Array;
  
        public function FriendsProxy(enforcer:SingletonEnforcer) 
		{
			if (enforcer == null)
				throw new Error("ParseUserDtoToVo is Singleton");
		} 
  
		public static function getInstance():FriendsProxy
		{ 
			if (FriendsProxy._instance == null) 
				FriendsProxy._instance = new FriendsProxy(new SingletonEnforcer()); 
			return FriendsProxy._instance; 
		} 
		
		public function get friendList():Array 
		{ 
			for (var i:int = 0; i < 100; i++)
			{
				var user:UserVO = new UserVO();
				user.id = i;
				user.name = "name" + i;
				user.level = i;
				
				if (_friendList == null)
					_friendList = new Array();
				_friendList.push(user);
			}
			return _friendList; 
			
		}
	}
}

class SingletonEnforcer {}