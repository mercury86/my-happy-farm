package view.friend 
{
	import data.vo.UserVO;
	
	/**
	 * ...
	 * @author mcko
	 */
	public class UserAssistant  
	{
		
		public function UserAssistant () 
		{
			
		}
		
		public static function findUserPositionFromListById(user:UserVO,list:Array):int
		{
			if (list == null || user == null) return -1;
			for (var i:int = 0; i < list.length; i++)
			{
				if (user.id == list[i].id) return i;
			}
			return -1;
		}
		
	}
}