package utils 
{
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	
	/**
	 * 提示框
	 * @author mcko
	 */
	public class Alert
	{
		public static var YES:String = "yes";
		public static var NO:String = "no";
		public static var CONFIRM:String = "confirm";
		
		public function Alert() 
		{
		}
		
		public static function show(message:String,title:String,parent:DisplayObjectContainer,flag:int=1,clickHandler:Function=null):void
		{
			if (parent == null)
			{
				throw new Error("parent对象 不能为空");
				return;
			}
			
			var dialogBox:DialogBox = new DialogBox();
			dialogBox.showCloseBtn = true;
			parent.addChild(dialogBox);
			dialogBox.dialogMc.tip_txt.text = message;
			dialogBox.dialogMc.title_txt.text = title;
			
			if (flag != 2)
				 dialogBox.dialogMc.confirm_btn.visible = true;
			else
			{
				dialogBox.dialogMc.yes_btn.visible = true;
				dialogBox.dialogMc.no_btn.visible = true;
			}
				
			dialogBox.dialogMc.yes_btn.addEventListener(MouseEvent.CLICK, function():void { clickHandler.apply(parent, [Alert.YES]); dialogBox.onClose(); } );
			dialogBox.dialogMc.no_btn.addEventListener(MouseEvent.CLICK,function():void{clickHandler.apply(parent,[Alert.NO]); dialogBox.onClose(); });
			dialogBox.dialogMc.confirm_btn.addEventListener(MouseEvent.CLICK,function():void{clickHandler.apply(parent,[Alert.CONFIRM]); dialogBox.onClose(); });
			
		}
	}

}

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.filters.BlurFilter;
import flash.display.DisplayObjectContainer;
import flash.events.*;
import view.*;

class DialogBox extends DialogBase 
{

	public static const SUCCESS:String = "success";
	public static const ERROR:String = "error";
	public static const WARNING:String = "warning";
	public static const TIP:String = "tip";

	private var _type:String = DialogBox.SUCCESS;
	private var _msg:String;
	
		
	public function DialogBox() 
	{
		this.dialogMcName = "system_tip_mc";
	}

	override protected function main():void 
	{
		this.dialogMc.yes_btn.visible = false;
		this.dialogMc.no_btn.visible = false;
		this.dialogMc.confirm_btn.visible = false;
	}

	
	override protected function addEventFun():void
	{
		super.addEventFun();
	}

	override protected function removEvent():void
	{
		super.removEvent();
	}
	
	override protected function dispose():void
	{
		super.dispose();
	}
	
	
	public function get type():String { return _type; }
	
	public function set type(value:String):void
	{
		_type = value;
	}
	
	public function get msg():String { return _msg; }
	
	public function set msg(value:String):void 
	{
		_msg = value;
	}

}