package chipura.UI
{
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.text.TextFieldAutoSize;
	import starling.text.TextFormat;
	import starling.textures.TextureAtlas;
	import starling.utils.Align;
	
	/**
	 * Абстрактный класс Текстового поля
	 * @author Наталья Чипура NatalyChipura@gmail.com
	 */
	public class ATFieldClass extends Sprite
	{
		/**
		 * Отступы для отображения текста
		 */
		static public const MARGIN:uint = 22;
		/**
		 * Размер шрифта
		 */
		static public const FONT_SIZE:uint = 32;
		
		/**
		 * Текстура отображения текстового поля
		 */
		private var _texture:TextureAtlas;
		/**
		 * Текст сообщения
		 */
		private var _txtMess:String;
		// MovieClip тестового поля
		private var mcTF:MovieClip;
		// TextField для вывода сообщения
		private var tf:TextField;
		
		public function ATFieldClass(ta:TextureAtlas, txt:String = "", txtColor:uint=0xFFFFFF)
		{
			super();
			
			// установка текстуры
			texture = ta;
			
			// создание текстового поля
			tf = new TextField(mcTF.width - 2 * MARGIN, mcTF.height- 2 * MARGIN, "", new TextFormat("Shadow", FONT_SIZE, txtColor, Align.CENTER, Align.CENTER));
			tf.alignPivot(Align.LEFT,Align.TOP);
			tf.autoScale = true;
		//	tf.autoSize = TextFieldAutoSize.HORIZONTAL;
			tf.x = tf.y = MARGIN;
			tf.y += 5;
			addChild(tf);
			tf.touchable = false;
			
			// вывод сообщения
			txtMess = txt;
		}
		
		//////////////////////// GETTERs & SETTERs ///////////////////////////
		
		public function set texture(value:TextureAtlas):void
		{
			_texture = value;
			
			mcTF = new MovieClip(_texture.getTextures(), 1);
			
			addChild(mcTF);
			Starling.juggler.add(mcTF);
		
		}
		
		public function set txtMess(value:String):void
		{
			_txtMess = tf.text = value;
		}
	
	}

}