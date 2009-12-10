package 
{
	import com.utils.DebugTrace;
	import data.DataConst;
	import data.EventConst;
	import data.NumWithClass;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import socket.ServerInfoDeal;
	import utils.CoordinateTransform;
	import view.Bg;
	import view.BottomBar;
	import view.FarmContain;
	import view.Field;
	import view.FieldArea;
	import view.FriendBar;
	import view.MouseFollow;
	import view.TopBar;
	
	/**
	 * Main文件只用做初始布局，不打算做其他的操作。
	 * 编程思路：
	 * 本人觉得，元件的状态应该被动的根据与之相关的数据变化来改变，为什么要说被动呢？
	 * 游戏其实就是一堆数字的变化：菜的成长值变化了，用户当前的操作变化了，和服务器之间的链接断线了，等等等等。
	 * 都是数据的变化，菜的成长值变化了，菜元件从小丫变成了小叶；
	 * 					用户的操作变化了，鼠标跟随元件从手型变成铁锹
	 * 					和服务器段开链接了，弹出提示框
	 * 下面简单的举个例子：从服务器传送过来一个信息：菜的成长状态变化了
	 * 我们可以在收到信息后，修改mc的状态同时修改菜的状态值。
	 * 也可以用function set status(value){_status=value
	 * 										mc.gotoAndStop(value);
	 * 									}
	 * 来修改状态值，同时，修改mc的状态。
	 * 显然第二种方法比第一种好用的多，更符合opp思想。
	 * 
	 * 这里整理一下再开心农场游戏中，哪些地方会触动数据的变化：
	 * 1.服务器传送过来的信息
	 * 		-用户主动请求：如种菜，商店购买
	 * 		-server端主动发送：如，蔬菜生长状态的变化
	 * 2.用户操作：如，切换操作
	 * 3.由上两个中情况引发的程序更改数据，暂时想不到合适的例子-_-||
	 * 
	 * MainController类用来接收界面点击事件，还有修改MainData中的数据
	 * 
	 ** @author zhengzihua
	 * blog ------ http://blog.sina.com.cn/u/1442798893
	 */
	public class Main extends Sprite 
	{
		//可视mc，作为view,它应该能直接控制mainControl，因此，view和mainControl是有联系的。这里，我把mainControl设置成静态公共变量
		private var mainStage:Sprite;
		private var bg:Bg;//游戏背景
		private var topBar:Sprite;
		private var bottomBar:Sprite;
		private var friendBar:FriendBar;
		private var fieldContain:Sprite;
		private var plantContain:Sprite;
		private var fieldAreaContain:Sprite;
		private var mouseFollow:MovieClip;
		
		public static var mainControl:MainController;
		private var mainData:MainData;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// all start at this--------------------------------------------------
			ServerInfoDeal.connectServer(this);
			mainData = new MainData();
			mainControl = new MainController(mainData);
			
			layout();
			initData();
		}
		private function layout():void {
			stateDisplayObj()
			//侦听mainData中的数据，调用MouseFollow中的方法
			mainData.addEventListener(EventConst.EVENT_CHANGE_OPERATE, mouseFollow.changeIcon);
			showDisplayObj();
			setFarmP(DataConst.FARMCONTAIN_X,DataConst.FARMCONTAIN_Y);
			fieldLayout(fieldContain, Field, DataConst.FIELD_ROW, DataConst.FIELD_COLS);
			fieldLayout(fieldAreaContain, FieldArea, DataConst.FIELD_ROW, DataConst.FIELD_COLS);
		}
		private function stateDisplayObj():void {
			mainStage = new Sprite();
			bg = new Bg();
			topBar = new TopBar();
			bottomBar = new BottomBar(250, 500);
			friendBar = new FriendBar(0,550);		
			fieldContain = new FarmContain();
			plantContain = new FarmContain();
			fieldAreaContain = new FarmContain();
			mouseFollow = new MouseFollow();
		}
		/**
		 * view中元件的放置
		 */
		private function showDisplayObj():void {
			mainStage.addChild(bg);
			mainStage.addChild(fieldContain);
			mainStage.addChild(plantContain);
			mainStage.addChild(fieldAreaContain);
			mainStage.addChild(mouseFollow);
			addChild(mainStage);
			addChild(topBar);
			addChild(bottomBar);
			addChild(friendBar);
		}
		/**
		 * 设置fieldAreaContain,fieldContain,plantContain三个容器的位置
		 * @param	cx
		 * @param	cy
		 */
		private function setFarmP(cx:int,cy:int):void {
			fieldContain.x = cx;
			fieldContain.y = cy;
			plantContain.x = cx;
			plantContain.y = cy;
			fieldAreaContain.x = cx;
			fieldAreaContain.y = cy;	
		}
		/**
		 * 布局farm
		 * @param	contain		容器
		 * @param	mcClass		放入容器的元件的类
		 * @param	row			行数
		 * @param	cols		列数
		 */
		private function fieldLayout(contain:Sprite,mcClass:Class ,row:int, cols:int):void {
			for (var i:int = 0; i < row; i++ ) {
				for (var j:int=0; j < cols; j++ ) {
					var mc:* = new mcClass(i, j);
					var c:Array = CoordinateTransform.coorTransform(i, j);
					mc.x = c[0];
					mc.y = c[1];
					contain.addChild(mc);
					//如果现在摆放的是fieldArea，那么，将fieldArea.field赋值。
					if (mc as FieldArea != null) {
						var field=fieldContain.getChildByName("f" + i + "_" + j) as Field;
						if (field != null) {
							mc.field = field; 
						}else {
							DebugTrace.dtrace("code info Main.as:fieldArea没有对应的field。");
							return;
						}
					}else {
						
					}
				}	
			}
		}
		/**
		 * 在农田中放置植物
		 * @param	contain		装载该元件的容器
		 * @param	num		该元件在列表中的编号
		 * @param	row		放置的位置
		 * @param	cols	放置的位置
		 * @param	status	状态
		 */
		private function plantLayout(contain:Sprite, num:int, row:int, cols:int, status:int):void {
			var mcClass:Class = NumWithClass.numWithClass(num);
			var plantMc:*= new mcClass();
			var fieldArea:FieldArea = contain.getChildByName("fa" + row + "_" + cols) as FieldArea;
			var c:Array = CoordinateTransform.coorTransform(row, cols);
			fieldArea.crop = plantMc;//给fieldArea赋值
			contain.addChild(plantMc);
			plantMc.name = "p" + row + "_" + cols;
			plantMc.x = c[0];
			plantMc.y = c[1];
		}
		private function initData():void {
			mainData.login = true;
			mainData.isMyFarm = true;
			mainData.operate = "select";
			bg.url = "bg.jpg";
		}
	}
}