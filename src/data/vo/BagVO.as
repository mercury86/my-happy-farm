package data.vo 
{
	/**
	 * ...
	 * @author ...
	 */
	public class BagVO
	{
		
		public function BagVO() 
		{
			
		}
		
		private var _id:int;
		private var _uid:int;               
		private var _product_id:int;          
		private var _category:int;             
		private var _count:int;               
		private var _add_time:int;             
		private var _update_time:int;   
		
		private var _products:ProductsData;
		
		public function get id():int { return _id; }
		
		public function set id(value:int):void 
		{
			_id = value;
		}
		
		public function get uid():int { return _uid; }
		
		public function set uid(value:int):void 
		{
			_uid = value;
		}
		
		public function get product_id():int { return _product_id; }
		
		public function set product_id(value:int):void 
		{
			_product_id = value;
		}
		
		public function get category():int { return _category; }
		
		public function set category(value:int):void 
		{
			_category = value;
		}
		
		public function get count():int { return _count; }
		
		public function set count(value:int):void 
		{
			_count = value;
		}
		
		public function get add_time():int { return _add_time; }
		
		public function set add_time(value:int):void 
		{
			_add_time = value;
		}
		
		public function get update_time():int { return _update_time; }
		
		public function set update_time(value:int):void 
		{
			_update_time = value;
		}
		
		public function get products():ProductsData { return _products; }
		
		public function set products(value:ProductsData):void 
		{
			_products = value;
		}
		
	}

}