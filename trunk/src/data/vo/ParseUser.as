package data.vo 
{
	/**
	 * 将后台传输的对象转换成前台对象
	 * @author mcko
	 */
	public class ParseUser
	{
		
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
			if(obj.id!=null)userVO.id = obj.id;
			//用户uid
			if(obj.uid!=null)userVO.uid = obj.uid;
			//用户名
			if(obj.name!=null)userVO.name = obj.name;
			//等级
			if(obj.level!=null)userVO.level = obj.level;
			//经验值
			if(obj.experience!=null)userVO.experience = obj.experience;
			//升级经验
			if(obj.next_experience!=null)userVO.nextExperience = obj.next_experience;
			//金币
			if(obj.cash!=null)userVO.cash = obj.cash;
			//酷币
			if(obj.kool!=null)userVO.kool = obj.kool;
			//声望
			if(obj.credit!=null)userVO.credit = obj.credit;
			//随机天气状况0晴天1下雨
			if(obj.weather!=null)userVO.weather = obj.weather;
			//背景ID
			if(obj.background!=null)userVO.background = obj.background;
			
			//狗狗 0没有,否则就是狗狗的id号
			if(obj.dog!=null)userVO.dog = obj.dog;

			//邮箱
			if(obj.email!=null)userVO.email = obj.email;
			//头像
			if(obj.img!=null)userVO.headUrl = obj.img;
			//头像缩略图
			if(obj.tinyUrl!=null)userVO.tinyUrl = obj.tinyUrl;
			//性别 女0男1
			if(obj.gender!=null)userVO.gender = obj.gender;
			// 最后登录ip
			if(obj.lastIp!=null)userVO.lastIp = obj.lastIp;
		
			
			if(obj.create_time!=null)userVO.create_time = obj.create_time;
			//等级更新时间
			if(obj.level_updatetime!=null)userVO.level_updatetime = obj.level_updatetime;
			//经验值更新时间
			if(obj.experience_updatetime!=null)userVO.experience_updatetime = obj.experience_updatetime
			//金币更新时间
			if(obj.cash_updatetime!=null)userVO.cash_updatetime = obj.cash_updatetime;
			//背景更新时间
			if(obj.background_updatetime!=null)userVO.background_updatetime = obj.background_updatetime;
			
			return userVO;
		}
		
	}
}

class SingletonEnforcer {}