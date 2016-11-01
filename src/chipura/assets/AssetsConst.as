package chipura.assets 
{
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.AssetManager;
	/**
	 * Класс хранения констант и атласов
	 * @author Наталья Чипура NatalyChipura@gmail.com
	 */
	public class AssetsConst 
	{
		
		/////////////////// SCREENs /////////////////////////////////////////////////
		public static const SPLASH_TIME_SHOW:uint = 0;
		public static const SCREEN_TIMESHOW:uint = 1;
		public static const SCREEN_TIMEAPPEAR:uint = 1;
		
		/////////////////// EVENTs //////////////////////////////////////////////////
		public static const EVENT_SCREEN_HIDE:String = "EvtScreenHide";
		public static const EVENT_START:String = "EvtStart";
		
		/////////////////// FONTs ////////////////////////////////////////////////////
		[Embed(source="font/shadow_regular.ttf", embedAsCFF="false", fontFamily="Shadow")]
		private static const FontShadowRegular:Class;	
		
		////////////////// TEXTUREs EMBEDs //////////////////////////////////////////
		[Embed(source="img/SplashScreen.png")]
		public static const TextureSplashScreen:Class;
		
		////////////////// ATLAS TEXTUREs //////////////////////////////////////////
		
		private static var _embeds:AssetManager;
		
		static public function get embeds():AssetManager 
		{
			return _embeds;
		}
		
		static public function set embeds(value:AssetManager):void 
		{
			if(!_embeds){
				_embeds = value;
			} else {
				trace("AssetManager already exists.");
			}
		}
		
	}

}