package chipura.screens 
{
	import chipura.assets.AssetsConst;
	import chipura.MainClass;
	import chipura.UI.AButtonClass;
	import chipura.UI.BtnYellow;
	import chipura.UI.UIData;
	
	import flash.geom.Point;

	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	import starling.core.Starling;

	/**
	 * Класс экрана 1
	 * @author Наталья Чипура NatalyChipura@gmail.com
	 */
	internal class Scene1Class  extends AScreen 
	{
		private var btnStart:AButtonClass;
		
		public function Scene1Class () 
		{
			super();
		}
		
		/**
		 * Инициализация эрана
		 */
		override protected function init():void 
		{
			// установка фона
			var fonScreen : MovieClip = new MovieClip(uiData.textureScreens.getTextures("Scene1Instance"), 1);
			addChild(fonScreen);
			Starling.juggler.add(fonScreen);
			
			// установка кнопок
			var massBtns:UIData = UIData(uiData.massUI[ScreenFactory.SCREEN_1][UIData.TYPE_BTN]);
			if(massBtns){
				var titles:Vector.<String> = massBtns.titles;
				var pos:Vector.<Point> = massBtns.positions;
				
				for (var key:uint in titles){
					var btn:AButtonClass = new BtnYellow(titles[key]);
					var pt:Point = pos[key] as Point;
					btn.x = pt.x;
					btn.y = pt.y;
					addChild(btn);
					uis.push(btn);
				}
				
				btnStart = (uis[0] as AButtonClass);
				btnStart.addEventListener(TouchEvent.TOUCH, onBtnTouch);
			}
			
			var massTFs:UIData = UIData(uiData.massUI[ScreenFactory.SCREEN_2][UIData.TYPE_TF]);
			if (massTFs) {
				// размещаем Текстовые поля, если они есть
			}
		}
		
		/**
		 * Обработка нажатия кнопки Start
		 * @param	e
		 */
		private function onBtnTouch(e:TouchEvent):void
		{
			
			var touch:Touch = e.getTouch(btnStart);
			if(touch)
			{
				if (touch.phase == TouchPhase.ENDED) {
					// исчезновение экрана
					Disappearance();
					btnStart.removeEventListener(TouchEvent.TOUCH, onBtnTouch);
				}
			}
 
		}
		
	}

}