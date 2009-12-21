package 
{
	import com.event.EventZheng;
	import com.utils.BatchLoad;
	import data.DataConst;
	import data.EventConst;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import socket.RequestToServer;
	import socket.ServerInfoDeal;
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
		private var mainControl:MainController;
		private var mainData:MainData;
		private var mainView:MainView;
		
		public static var thisStage:Stage;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// all start at this--------------------------------------------------
			/**
			 * 1.连接服务器
			 * 2.请求素材数据
			 * 3.数据导入完成，布局view
			 * 4.请求个人信息，和农场信息，以及好友列表
			 */
			thisStage = stage;
			ServerInfoDeal.connectServer();//连接服务器
			//登陆请求
			var requestToserver:RequestToServer = RequestToServer.getInstance();
			requestToserver.req_login(DataConst.USERID);
			//侦听素材导入
			stage.addEventListener(EventConst.EVENT_LIB_LOADCOMPLETE, onLibLoaded);
		}
		
		private function onLibLoaded(e:EventZheng):void 
		{		
			mainData = new MainData();
			mainControl = new MainController(mainData);
			mainView = MainView.getInstance();
			mainView.setData(mainControl, mainData, thisStage);	
			stage.removeEventListener(EventConst.EVENT_LIB_LOADCOMPLETE, onLibLoaded);
			
			var requestToserver:RequestToServer = RequestToServer.getInstance();
			//农场主信息请求
			requestToserver.req_userInfo(DataConst.USERID);
			//农田信息请求
			requestToserver.req_farmInfo(DataConst.USERID);
			//请求好友列表
			requestToserver.req_friendList(DataConst.USERID);	
			
			initData();
		}
		private function initData():void {
			mainData.login = true;
			mainData.operate = "select";
			mainData.bgUrl = "bg.jpg";
		}
	}
}