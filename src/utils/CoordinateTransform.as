package utils 
{
	import data.DataConst;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class CoordinateTransform 
	{
		
		public function CoordinateTransform() 
		{
			
		}
		public static function coorTransform(row:int,cols:int):Array {
			var cx:int = (row + cols) * DataConst.FIELD_WIDTH * 0.5;
			var cy:int = (row - cols) * DataConst.FIELD_HEIGHT * 0.5;
			return new Array(cx, cy);
		}
		
	}
	
}