package chipura.assets 
{
	/**
	 * Класс атласов SWF объектов
	 * @author Nataly Chipura (NatalyChipura@gmail.com)
	 */
	public class AssetsSWF 
	{
		[Embed(source = 'swf/resource.swf', symbol = "BtnYellow")] 
		public static var BtnYellow:Class;
		
		[Embed(source = 'swf/resource.swf', symbol = "TFieldYellow")] 
		public static var TFYellow:Class;
		
		[Embed(source = 'swf/resource.swf', symbol = "SpriteSheet")] 
		public static var SpriteSheet:Class;
	}

}