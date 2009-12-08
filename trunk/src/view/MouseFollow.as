package view 
{
	import com.event.EventZheng;
	import flash.display.MovieClip;
	
	/**
	 * 鼠标跟随显示的图标
	 * @author zhengzihua
	 */
	public class MouseFollow extends MovieClip
	{
		
		public function MouseFollow() 
		{
			
		}
		public function changeIcon(e:EventZheng):void {
			var type:String = e.obj.operate;
			gotoAndStop(type);
		}
		
	}
	
}