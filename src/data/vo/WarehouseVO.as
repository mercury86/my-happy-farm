package data.vo 
{
	/**
	 * 仓库对象
	 * @author mcko
	 */
	public class WarehouseVO
	{
		
		public function WarehouseVO() 
		{
		}
		
		private var _id:int;
		private var _uid:int;
		private var _product_id:int;
		private var _count:int
		private var _add_time:Number;
		private var _update_time:Number;
		
		//0历史,1当前
		private var _category:int;  

		//extends
		private var _products:ProductsData;
		
		
		public function get id():int { return _id; }
		
		public function get uid():int { return _uid; }
		
		public function get product_id():int { return _product_id; }
		
		public function get count():int { return _count; }
		
		public function get add_time():Number { return _add_time; }
		
		public function get update_time():Number { return _update_time; }
		
		public function get products():ProductsData { return _products; }
		
		public function set products(value:ProductsData):void 
		{
			_products = value;
		}
		
		public function set count(value:int):void 
		{
			_count = value;
		}
		
	}

}