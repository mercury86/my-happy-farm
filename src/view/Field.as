﻿package view 
{
	import com.utils.DebugTrace;
	import data.DataConst;
	import flash.display.MovieClip;
	import socket.RequestToServer;
	
	/**
	 * 农田
	 * @author zhengzihua
	 */
	public class Field extends MovieClip
	{
		private var _row:int;
		private var _cols:int;
		/**
		 * 第一帧是未开垦，
		 * 第二帧是正常
		 * 第三帧是肥沃
		 * 第四帧是干涸
		 */
		private var _status:int;
		public function Field(sx:int,sy:int) 
		{
			stop();
			_row = sx;
			_cols = sy;
			name = "f" + sx + "_" + sy;
		}
		public function watering():void {
			if (_status == 4) {
				var requestToServer:RequestToServer = RequestToServer.getInstance();
				requestToServer.req_watering(DataConst.USERID, _row, _cols);
			}else {
				DebugTrace.dtrace("code info Field.as:土地不需要浇水。")
			}
		}
		public function killWeed():void {
			
		}
		public function putWeed():void {
			
		}
		public function fertilize():void {
			//土地正常的时候才能施肥
			if (_status == 2) {
				var requestToServer:RequestToServer = RequestToServer.getInstance();
				requestToServer.req_feitilize(DataConst.USERID, _row, _cols);
			}else if (_status == 1) {
				//未开垦，不提示
			}else {
				DebugTrace.dtrace("code info Field.as:土地不在正常状态，不能施肥。")
			}
		}
		public function get cols():int { return _cols; }
		
		public function set cols(value:int):void 
		{
			_cols = value;
		}
		
		public function get row():int { return _row; }
		
		public function set row(value:int):void 
		{
			_row = value;
		}
		
		public function get status():int { return _status; }
		
		public function set status(value:int):void 
		{
			_status = value;
			gotoAndStop(value);
		}
		
	}
	
}