package data 
{
	import com.utils.DebugTrace;
	import flash.system.ApplicationDomain;
	
	/**
	 * 物品的编号和类的对应关系
	 * @author zhengzihua
	 */
	public class NumWithClass 
	{
		
		public function NumWithClass() 
		{
			
		}
		public static function numWithClass(num:int):Class {
			var mcClass:Class;
			switch(num) {
				case 10001:
					return mcClass=ApplicationDomain.currentDomain.getDefinition("PlantApple") as Class;
					break;
				case 10002:
					break;
				default:
					DebugTrace.dtrace("code info NumWithClass.as:没有和编号对应的类。");
					break;
			}
			return mcClass;
		}
		
	}
	
}