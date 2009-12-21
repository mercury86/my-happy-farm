package 
{
	import com.event.EventZheng;
	import flash.display.Stage;
	import com.utils.DebugTrace;
	import data.DataConst;
	import data.EventConst;
	import data.NumWithClass;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import socket.ServerInfoDeal;
	import utils.CoordinateTransform;
	import view.*;
	import view.plant.PlantInstance;
	/**
	 * 单例，全局就这一份，存储所有的视图
	 * @author zheng sir
	 */
	public class MainView 
	{
		public var mainStage:Sprite;//游戏场景
		public var bg:Bg;//游戏背景
		public var topBar:Sprite;//个人信息以及商店等。
		public var bottomBar:Sprite;//操作栏
		public var friendBar:FriendBar;//好友栏
		public var toolBar:ToolBar;
		public var expandMc:ExpandMc;
		
		//土地、植物、操作区域的三个容器
		public var fieldContain:Sprite;
		public var plantContain:Sprite;
		public var fieldAreaContain:Sprite;
		//存放21块田的信息
		public var fieldArr:Array=[];
		public var plantArr:Array=[];
		public var fieldAreaArr:Array=[];
		
		public var mouseFollow:MovieClip;//鼠标跟随
		public var loadingBar:LoadingBar;//loading条
		
		
		public var mainControl:MainController;
		public var mainData:MainData;
		
		private var targetStage:Stage;
		private static var instance:MainView;//实例
		
		public function MainView(sigleton:SingletonMainView) 
		{
			
		}
		public static function getInstance():MainView {
			if (instance == null) {
				instance=new MainView(new SingletonMainView())
			}else {
				DebugTrace.dtrace("code info MainView.as:已经实例化.")
			}
			return instance;
		}
		public function setData(control:MainController,mode:MainData,target:Stage):void {
			mainControl = control;
			mainData = mode;
			targetStage = target;
			iniArr()
			layout();
			
			test();
		}
		private function iniArr():void {
			for (var i:int; i < DataConst.FIELD_ROW; i++ ) {
				fieldArr.push(new Array(DataConst.FIELD_COLS));
				fieldAreaArr.push(new Array(DataConst.FIELD_COLS));
				plantArr.push(new Array(DataConst.FIELD_COLS));
			}
		}
		public function test():void {
			//test--------
			plantLayout(plantContain, fieldAreaContain,1, 0, 1, 4);//植物的状态
			plantLayout(plantContain, fieldAreaContain,0, 1, 2, 2);//植物的状态
			plantLayout(plantContain, fieldAreaContain,2, 1, 0, 3);//植物的状态
			landLayout(fieldContain, 0, 1, 3);//土地的状态
			landLayout(fieldContain, 1, 2, 3);//土地的状态
			landLayout(fieldContain, 1, 0, 3);//土地的状态
			landLayout(fieldContain, 1, 1, 4);//土地的状态
		}
		private function layout():void {
			stateDisplayObj()
			//侦听mainData中的数据，调用MouseFollow中的方法
			mainData.addEventListener(EventConst.EVENT_CHANGE_OPERATE, mouseFollow.changeIcon);
			mainData.addEventListener(EventConst.EVENT_CHANGE_BG, function (e:EventZheng):void { bg.loadBg(targetStage,loadingBar,e.obj.bgUrl)} );
			showDisplayObj();
			setFarmP(DataConst.FARMCONTAIN_X,DataConst.FARMCONTAIN_Y);
			fieldLayout(fieldContain, fieldArr,Field, DataConst.FIELD_ROW, DataConst.FIELD_COLS);
			fieldLayout(fieldAreaContain,fieldAreaArr, FieldArea, DataConst.FIELD_ROW, DataConst.FIELD_COLS);
		}
		private function stateDisplayObj():void {
			loadingBar = LoadingBar.getInstance();
			mainStage = new Sprite();
			bg = new Bg();
			topBar = new TopBar();
			bottomBar = new BottomBar(250, 500);
			friendBar = new FriendBar(0, 550);
			toolBar = new ToolBar(642, 0);
			expandMc = new ExpandMc();
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
			mainStage.addChild(expandMc);
			
			targetStage.addChild(mainStage);
			targetStage.addChild(topBar);
			targetStage.addChild(bottomBar);
			targetStage.addChild(friendBar);
			targetStage.addChild(toolBar);
			targetStage.addChild(mouseFollow);
			
		}
		/**
		 * 设置fieldAreaContain,fieldContain,plantContain三个容器的位置
		 * @param	cx
		 * @param	cy
		 */
		private function setFarmP(cx:int, cy:int):void {
			expandMc.x = cx;
			expandMc.y = cy;
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
		private function fieldLayout(contain:Sprite,arr:Array,mcClass:Class ,row:int, cols:int):void {
			for (var i:int = 0; i < row; i++ ) {
				for (var j:int=0; j < cols; j++ ) {
					var mc:* = new mcClass(i, j);
					var c:Array = CoordinateTransform.coorTransform(i, j);
					mc.x = c[0];
					mc.y = c[1];
					contain.addChild(mc);
					arr[i][j] = mc;//将实例添加到数组
					//如果现在摆放的是fieldArea，那么，将fieldArea.field赋值。
					if (mc is FieldArea) {
						var fieldArea:FieldArea = mc as FieldArea;
						fieldArea.addEventListener(MouseEvent.CLICK, mainControl.onAreaClick);
						var field:Field = fieldArr[i][j];
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
		public function plantLayout(contain:Sprite,areaContain:Sprite, num:int, row:int, cols:int, status:int):void {
			var mcClass:Class = NumWithClass.numWithClass(num);
			var plantMc:*= new mcClass();
			var fieldArea:FieldArea = areaContain.getChildByName("fa" + row + "_" + cols) as FieldArea;
			var c:Array = CoordinateTransform.coorTransform(row, cols);
			var plantInstance:PlantInstance = new PlantInstance(plantMc);
			plantInstance.status = status;
			fieldArea.crop = plantInstance;//给fieldArea赋值
			contain.addChild(plantInstance);
			plantInstance.name = "p" + row + "_" + cols;
			plantInstance.x = c[0];
			plantInstance.y = c[1];
			plantInstance.plantName = "苹果树";
			plantInstance.periodTime = 3600;
			plantArr[row][cols] = plantInstance;//实例添加到数组中
		}
		public function landLayout(contain:Sprite, row:int, cols:int, status:int):void {
			var field:Field = contain.getChildByName("f" + row + "_" + cols) as Field;
			field.status = status;
		}
	}

}
class SingletonMainView{}