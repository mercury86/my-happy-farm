package data.vo 
{
	/**
	 * 将后台传输的对象转换成前台对象
	 * @author mcko
	 */
	public class ParseUser
	{
		
		public function ParseUser() 
		{
		}
		
		private static var _instance:ParseUser; 
  
        public function ParseUser(enforcer:SingletonEnforcer) 
		{
			if (enforcer == null)
				throw new Error("ParseUserDtoToVo is Singleton");
		} 
  
		public static function getInstance():ParseUser
		{ 
			if (ParseUser._instance == null) 
				ParseUser._instance = new ParseUser(new SingletonEnforcer()); 
			return ParseUser._instance; 
		} 
		
		
		public function parseUserDtoToVo(obj:Object):UserVO
		{
			var userVO:UserVO = new UserVO();
			
			userVO.id = obj.id;
			//用户uid
			userVO.uid = obj.uid;
			//用户名
			userVO.name = obj.name;
			//等级
			userVO.level = obj.level;
			//经验值
			userVO.experience = obj.experience;
			
			//金币
			userVO.cash = obj.cash;
			//酷币
			userVO.kool = obj.kool;
			//声望
			userVO.credit = obj.credit;
			//随机天气状况0晴天1下雨
			userVO.weather = obj.weather;
			//背景ID
			userVO.background = obj.background;
			
			//狗狗 0没有,否则就是狗狗的id号
			userVO.dog = obj.dog;

			//邮箱
			userVO.email = obj.email;
			//头像
			userVO.headUrl = obj.headUrl;
			//头像缩略图
			userVO.tinyUrl = obj.tinyUrl;
			//性别 女0男1
			userVO.gender = obj.gender;
			// 最后登录ip
			userVO.lastIp = obj.lastIp;
		
			
			userVO.create_time = obj.create_time;
			//等级更新时间
			userVO.level_updatetime = obj.level_updatetime;
			//经验值更新时间
			userVO.experience_updatetime = obj.
			//金币更新时间
			userVO.cash_updatetime = obj.cash_updatetime;
			//背景更新时间
			userVO.background_updatetime = obj.background_updatetime;
			
		}
		
	}
}

class SingletonEnforcer {}