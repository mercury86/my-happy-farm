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
		function set status(value:int):void ;
		function get status():int;
		
		function hoeing():void 
		function reap():void;
		function killWorm():void ;
		function putWorm():void ;
		function delThis():void;
	}
	
}