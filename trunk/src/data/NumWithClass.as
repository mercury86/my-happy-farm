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
			return mcClass=ApplicationDomain.currentDomain.getDefinition("plant_"+num) as Class;
		}
		
	}
	
}