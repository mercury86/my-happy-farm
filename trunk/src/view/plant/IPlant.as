package view.plant 
{
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public interface IPlant 
	{
		function set row(value:int):void ;
		function get row():int ;
		function set cols(value:int):void ;
		function get cols():int;
		
		function reap():void;
		function killWorm():void ;
		function putWorm():void ;
		function gotoStatus():void ;
		function delThis():void;
	}
	
}