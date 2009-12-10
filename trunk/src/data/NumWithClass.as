package data 
{
	import com.utils.DebugTrace;
	
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
				case "0001":
					break;
				case "0002":
					break;
				default:
					DebugTrace.dtrace("code info NumWithClass.as:没有和编号对应的类。");
					break;
			}
			return mcClass;
		}
		
	}
	
}