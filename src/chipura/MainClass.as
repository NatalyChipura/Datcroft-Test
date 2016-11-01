package chipura 
{
	import chipura.assets.AssetsConst;
	import chipura.assets.AssetsSWF;
	import chipura.screens.ScreenFactory;
	import chipura.UI.UIData;
	import com.emibap.DynamicAtlas;
	
	import flash.geom.Point;

	import starling.textures.TextureAtlas;

	/**
	 * Класс инициализации, подгрузки ресурсов в массив
	 * @author  Наталья Чипура NatalyChipura@gmail.com
	 */
	public class MainClass
	{
		private static var instance:MainClass;
		
		/**
		 * Атлас текстур экрано
		 */
		static private var _textureScreens:TextureAtlas;
		/**
		 * Текстура жёлтой кнопки
		 */
		static private var _textureBtnYellow:TextureAtlas;
		/**
		 * Текстура жёлтого текстового поля
		 */
		static private var _textureTFYellow:TextureAtlas;
		/**
		 * Массив UI элементов для экрана
		 */
		static private var _massUI:Array = new Array();
		/**
		 * Сообщение, передаваемое в приложении между классами
		 */
		static private var _mess:String;
		
		
		public function MainClass(singClass:SingletonClass)
		{
			
		}

		/**
		 * Instance класса MainClass
		 * @return
		 */
		public static function getInstance():MainClass
		{
			if(MainClass.instance == null){
				MainClass.instance = new MainClass(new SingletonClass());
				
				// инициализация контента
				initContent();
				
				//инициализация текстур
				initTextureAtlas();
			}
			
			return MainClass.instance;
		}
		
		/**
		 * Инициализация контента. Формирование массива UI элементов.
		 */
		static private function initContent():void 
		{
			_massUI[ScreenFactory.SCREEN_1] = new Array();
			_massUI[ScreenFactory.SCREEN_2] = new Array();
			_massUI[ScreenFactory.SCREEN_3] = new Array();
			
			_massUI[ScreenFactory.SCREEN_1][UIData.TYPE_BTN] = new UIData(Vector.<String>(["Start"]),Vector.<Point>([new Point(100, 300)]) );
			_massUI[ScreenFactory.SCREEN_2][UIData.TYPE_BTN] = new UIData(Vector.<String>(["showText1", "showText2"]), Vector.<Point>([new Point(100, 200), new Point(450, 200)]));
			_massUI[ScreenFactory.SCREEN_3][UIData.TYPE_TF] = new UIData(Vector.<String>([""]),Vector.<Point>([new Point(320, 50)]) );
		}
		
		/**
		 * Инициализация Атласа текстур для контента
		 */
		static private function initTextureAtlas():void 
		{
			try {
				// получаем страницу спрайтов
				var spriteSheet : *  = new AssetsSWF.SpriteSheet ();
				
				// создаем динамически атлас текстур из SWF
				_textureScreens = DynamicAtlas.fromMovieClipContainer(spriteSheet, 1, 0, true, true);
				
				// создаем текстуру кнопки из SWF
				_textureBtnYellow = getTextureAtlasFromAVector(AssetsSWF.BtnYellow, 2, 15);
				
				// создаем текстуру текстового поля из SWF
				_textureTFYellow = getTextureAtlasFromAVector(AssetsSWF.TFYellow, 2, 15);

			} catch (e:Error) {
				
				trace ("ERROR");
				trace (	"There was an error in the creation of the texture Atlas. ");
				trace (	"Please check if the dimensions of your clip exceeded the maximun ");
				trace (	"allowed texture size.");
				trace ("[[ " + e.message + " ]]");
					
			}
		}
		
		/**
		 * Получаем Атлас Текстур из вектора ассетов из SWF
		 * @param	mcClass - класс MovieClip в SWF
		 * @param	scale   - параметр масштабирования
		 * @param	margin	- отступы
		 * @param	preserveColor
		 * @param	checkBounds
		 * @return  атлас текстур
		 */
		static private function getTextureAtlasFromAVector(mcClass:Class,scale:Number=1,margin:uint = 0, preserveColor:Boolean = true, checkBounds:Boolean = false):TextureAtlas
		{
			var assets_vector_class:Vector.<Class> = new Vector.<Class> ();
			assets_vector_class.push(mcClass);
			
			var textureAtlas : TextureAtlas = DynamicAtlas.fromClassVector(assets_vector_class, scale, margin, preserveColor, checkBounds);
			return textureAtlas;
		}
		
		////////////////////////// GETTERs && SETTERs ////////////////////////////////////////
		
		public function get textureScreens():TextureAtlas 
		{
			return _textureScreens;
		}
		
		public function get textureBtnYellow():TextureAtlas 
		{
			return _textureBtnYellow;
		}
		
		public function get massUI():Array 
		{
			return _massUI;
		}
		
		public function get mess():String 
		{
			return _mess;
		}
		
		public function set mess(value:String):void 
		{
			_mess = value;
		}
		
		public function get textureTFYellow():TextureAtlas 
		{
			return _textureTFYellow;
		}
		
	}
}

class SingletonClass {
	public function SingletonClass() {
		trace("MainClass was created");
	}
}
