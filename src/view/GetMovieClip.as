package view 
{
	import flash.utils.*;
	import flash.display.MovieClip;
	import flash.utils.getDefinitionByName;
	
	public class GetMovieClip
	{
		public static function getMovieClip(clasName:String):*
		{
			var mc:* = Class(getDefinitionByName(clasName));
			
			return new mc  ;
		}
	}
	
	
}