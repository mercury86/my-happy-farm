package data.vo 
{
	/**
	 * 玩家对象
	 * @author mcko
	 */
	public class UserVO
	{
		public function UserVO() 
		{
		}
		
		//用户id
		private var _id:Number;
		//用户uid
		private var _uid:Number;
		//用户名
		private var _name:String;
		//等级
		private var _level:int;
		//经验值
		private var _experience:int;
		//升级经验
		private var _nextExperience:int
		
		//金币
		private var _cash:int;
		//酷币
		private var _kool:int;
		//声望
		private var _credit:int;
		//随机天气状况0晴天1下雨
		private var _weather:int;
		//背景ID
		private var _background:int;
		
		//狗狗 0没有,否则就是狗狗的id号
		private var _dog:int = 0;

		//邮箱
		private var _email:String;
		//头像
		private var _headUrl:String;
		//头像缩略图
		private var _tinyUrl:String;
		//性别 女0男1
		private var _gender:int;
		// 最后登录ip
		private var _lastIp:String;
	
		
		private var _create_time:Number;
		//等级更新时间
		private var _level_updatetime:Number;
		//经验值更新时间
		private var _experience_updatetime:Number;
		//金币更新时间
		private var _cash_updatetime:Number;
		//背景更新时间
		private var _background_updatetime:Number;
	
	
		public function get name():String { return _name; }
		
		public function get headUrl():String { return _headUrl; }
		
		public function get tinyUrl():String { return _tinyUrl; }
		
		public function get gender():int { return _gender; }
		
		public function get id():Number { return _id; }
		
		public function get uid():Number { return _uid; }
		
		public function get level():int { return _level; }
		
		public function set level(value:int):void 
		{
			_level = value;
		}
		
		public function get experience():int { return _experience; }
		
		public function set experience(value:int):void 
		{
			_experience = value;
		}
		
		public function get cash():int { return _cash; }
		
		public function set cash(value:int):void 
		{
			_cash = value;
		}
		
		public function get kool():int { return _kool; }
		
		public function set kool(value:int):void 
		{
			_kool = value;
		}
		
		public function get credit():int { return _credit; }
		
		public function set credit(value:int):void 
		{
			_credit = value;
		}
		
		public function get weather():int { return _weather; }
		
		public function set weather(value:int):void 
		{
			_weather = value;
		}
		
		public function get background():int { return _background; }
		
		public function set background(value:int):void 
		{
			_background = value;
		}
		
		public function get create_time():Number { return _create_time; }
		
		public function set create_time(value:Number):void 
		{
			_create_time = value;
		}
		
		public function get level_updatetime():Number { return _level_updatetime; }
		
		public function set level_updatetime(value:Number):void 
		{
			_level_updatetime = value;
		}
		
		public function get experience_updatetime():Number { return _experience_updatetime; }
		
		public function set experience_updatetime(value:Number):void 
		{
			_experience_updatetime = value;
		}
		
		public function get cash_updatetime():Number { return _cash_updatetime; }
		
		public function set cash_updatetime(value:Number):void 
		{
			_cash_updatetime = value;
		}
		
		public function get background_updatetime():Number { return _background_updatetime; }
		
		public function set background_updatetime(value:Number):void 
		{
			_background_updatetime = value;
		}
		
		public function get dog():int { return _dog; }
		
		public function set dog(value:int):void 
		{
			_dog = value;
		}
		
		public function set name(value:String):void 
		{
			_name = value;
		}
		
		public function set id(value:Number):void 
		{
			_id = value;
		}
		
		public function set uid(value:Number):void 
		{
			_uid = value;
		}
		
		public function set headUrl(value:String):void 
		{
			_headUrl = value;
		}
		
		public function set gender(value:int):void 
		{
			_gender = value;
		}
		
		public function set lastIp(value:String):void 
		{
			_lastIp = value;
		}
		
		public function set email(value:String):void 
		{
			_email = value;
		}
		
		public function set tinyUrl(value:String):void 
		{
			_tinyUrl = value;
		}
		
		public function get nextExperience():int { return _nextExperience; }
		
		public function set nextExperience(value:int):void 
		{
			_nextExperience = value;
		}
	}

}