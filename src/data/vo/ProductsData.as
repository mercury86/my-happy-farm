package data.vo{
	/**
	 * 玩家对象
	 * @author mcko
	 */
	public class ProductsData {


		//自动增产
		private var id:Number;
		//商品名称
		private var name:String;
		//商品图片
		private var img:String;
		//0;植物;1动物;3装饰品---商品种类tab
		private var category:int;
		//几季
		private var reuse_num:int;

		//购买单价
		private var buy_price:int;
		//售出单价
		private var sell_price:int;
		//需要等级
		private var required_level:int;


		//最小产出
		private var min_output:int;
		//最大产出
		private var max_output:int;


		//成熟时间
		private var ripe_time:Number;
		//再熟时间
		private var reripe_time:Number;
		//获得经验
		private var experience:int;






		public function ProductsData() {
		}
		public function get ids():String {
			return id;
		}
		public function get names():String {
			return name;
		}
		public function get imgs():String {
			return img;
		}
		public function get categorys():int {
			return category;
		}
		public function get reusenum():Number {
			return reuse_num;
		}
		public function get buyprice():Number {
			return buy_price;
		}
		public function get sellprice():int {
			return sell_price;
		}
		public function get requiredlevel():int {
			return required_level;
		}
		
		
		
		public function get minoutput():int {
			return min_output;
		}
		
		
		
		public function get maxoutput():int {
			return max_output;
		}
		
		public function get ripetime():int {
			return ripe_time;
		}
		public function get reripetime():int {
			return reripe_time;
		}
		
		public function get experiences():int {
			return experience;
		}
		
		



	}

}