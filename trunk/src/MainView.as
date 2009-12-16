﻿package 
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
	 * ...
	 * @author zheng sir
	 */
	public class MainView 
	{
		//可视mc，作为view,它应该能直接控制mainControl，因此，view和mainControl是有联系的。这里，我把mainControl设置成静态公共变量
		public var mainStage:Sprite;
		public var bg:Bg;//游戏背景
		public var topBar:Sprite;
		public var bottomBar:Sprite;
		public var friendBar:FriendBar;
		public var fieldContain:Sprite;
		public var plantContain:Sprite;
		public var fieldAreaContain:Sprite;
		public var mouseFollow:MovieClip;
		public var loadingBar:LoadingBar;//loading条
		
		public static var mainControl:MainController;
		public static var mainData:MainData;
		private var targetStage:Stage;
		public function MainView(control:MainController,mode:MainData,target:Stage) 
		{
			mainControl = control;
			mainData = mode;
			targetStage = target;
			layout();
			//test--------
			plantLayout(plantContain, fieldAreaContain, 10001, 0, 1, 4);//植物的状态
			landLayput(fieldContain, 0, 1, 2);//土地的状态
		}
		private function layout():void {
			stateDisplayObj()
			//侦听mainData中的数据，调用MouseFollow中的方法
			mainData.addEventListener(EventConst.EVENT_CHANGE_OPERATE, mouseFollow.changeIcon);
			mainData.addEventListener(EventConst.EVENT_CHANGE_BG, function (e:EventZheng):void { bg.loadBg(targetStage,loadingBar,e.obj.bgUrl)} );
			showDisplayObj();
			setFarmP(DataConst.FARMCONTAIN_X,DataConst.FARMCONTAIN_Y);
			fieldLayout(fieldContain, Field, DataConst.FIELD_ROW, DataConst.FIELD_COLS);
			fieldLayout(fieldAreaContain, FieldArea, DataConst.FIELD_ROW, DataConst.FIELD_COLS);
		}
		private function stateDisplayObj():void {
			loadingBar = LoadingBar.getInstance();
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
			
			targetStage.addChild(mainStage);
			targetStage.addChild(topBar);
			targetStage.addChild(bottomBar);
			targetStage.addChild(friendBar);
			targetStage.addChild(mouseFollow);
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
					if (mc is FieldArea) {
						var fieldArea:FieldArea = mc as FieldArea;
						fieldArea.addEventListener(MouseEvent.CLICK, mainControl.onAreaClick);
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
		private function plantLayout(contain:Sprite,areaContain:Sprite, num:int, row:int, cols:int, status:int):void {
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
		}
		private function landLayput(contain:Sprite, row:int, cols:int, status:int) {
			var field:Field = contain.getChildByName("f" + row + "_" + cols) as Field;
			field.status = status;
		}
	}

}