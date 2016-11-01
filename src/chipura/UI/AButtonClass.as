package chipura.UI
{
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.text.TextFieldAutoSize;
	import starling.text.TextFormat;
	import starling.textures.TextureAtlas;
	import starling.utils.Align;
	
	/**
	 * Абстрактный класс Кнопки
	 * @author Наталья Чипура NatalyChipura@gmail.com
	 */
	public class AButtonClass extends Sprite
	{
		/**
		 * Отступы от края кнопки для отображения текста
		 */
		static public const MARGIN:uint = 22;
		/**
		 * Размер шрифта для текста
		 */
		static public const FONT_SIZE:uint = 32;
		/**
		 * Текстура кнопки
		 */
		private var _texture:TextureAtlas;
		/**
		 * Надпись на кнопке
		 */
		private var _txtMess:String;
		// MovieClip кнопки
		private var mcBtn:MovieClip;
		// TextrField для вывода надписи на кнопке
		private var tf:TextField;
		
		public function AButtonClass(ta:TextureAtlas, txt:String = "", txtColor:uint=0xFFFFFF)
		{
			super();
			
			// установка текстуры
			texture = ta;
			
			// создание TextField
			tf = new TextField(mcBtn.width - 2 * MARGIN, mcBtn.height- 2 * MARGIN, "", new TextFormat("Shadow", FONT_SIZE, txtColor, Align.CENTER, Align.CENTER));
			tf.alignPivot(Align.LEFT,Align.TOP);
			tf.autoScale = true;
			tf.x = tf.y = MARGIN;
			tf.y += 5;
			addChild(tf);
			tf.touchable = false;
			
			// вывод надписи на кнопке
			txtMess = txt;
		}
		
		///////////////////////////// GETTERs & SETTERs ////////////////////////////////
		
		public function set texture(value:TextureAtlas):void
		{
			_texture = value;
			
			if (mcBtn) {
				removeChild(mcBtn);
				mcBtn.dispose();
				mcBtn = null;
			}
			
			// создаем MovieClip Кнопки
			mcBtn = new MovieClip(_texture.getTextures(), 3);
			mcBtn.loop = false;
			mcBtn.stop();
			mcBtn.currentFrame = 0;
			addChild(mcBtn);
			Starling.juggler.add(mcBtn);

			mcBtn.addEventListener(TouchEvent.TOUCH, onBtnTouch);		
		}
		
		/**
		 * Обрабатываем состояния кнопки Normal, Over, Press
		 * @param	e
		 */
		private function onBtnTouch(e:TouchEvent):void 
		{
			var touch:Touch = e.getTouch(this);
			if(touch)
			{
				
				if(touch.phase == TouchPhase.BEGAN)	{
                    mcBtn.currentFrame = 2;
					this.y += 3;
				} 
				
				if(touch.phase == TouchPhase.ENDED)	{
                    mcBtn.currentFrame = 0;    
					this.y -= 3;
					mcBtn.removeEventListener(TouchEvent.TOUCH, onBtnTouch);
				}  
				
				if(touch.phase == TouchPhase.HOVER) 	{
                   mcBtn.currentFrame = 1;  
				   mcBtn.color = 0xFFA700;
				} 
			} else {
				mcBtn.currentFrame = 0;   
				mcBtn.color = 0xFFFFFF;
			}
		}
		
		public function set txtMess(value:String):void
		{
			_txtMess = tf.text = value;
		}
	
	}

}