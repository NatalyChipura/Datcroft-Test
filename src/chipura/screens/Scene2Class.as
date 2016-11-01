package chipura.screens 
{
	import chipura.assets.AssetsConst;
	import chipura.MainClass;
	import chipura.UI.AButtonClass;
	import chipura.UI.BtnYellow;
	import chipura.UI.UIData;
	import flash.geom.Point;
	
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	import starling.core.Starling;

	/**
	 * Класс экрана 2 
	 * @author Наталья Чипура NatalyChipura@gmail.com
	 */
	internal class Scene2Class  extends AScreen 
	{
		
		public function Scene2Class () 
		{
			// показ постоянно, время появления SCREEN_TIMEAPPEAR
			super(AScreen.SCREEN_SHOW_FOREVER, AssetsConst.SCREEN_TIMEAPPEAR);
		}
		
		/**
		 * Инициализация эрана
		 */
		override protected function init():void 
		{		
			// установка фона
			var fonScreen : MovieClip = new MovieClip(uiData.textureScreens.getTextures("Scene2Instance"), 1);
			addChild(fonScreen);
			Starling.juggler.add(fonScreen);
			
			/// установка кнопок
			var massBtns:UIData = UIData(uiData.massUI[ScreenFactory.SCREEN_2][UIData.TYPE_BTN]);
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
				
				(uis[0]  as BtnYellow).addEventListener(TouchEvent.TOUCH, onBtn1Touch);
				(uis[1]  as BtnYellow).addEventListener(TouchEvent.TOUCH, onBtn2Touch);
			}
			
			var massTFs:UIData = UIData(uiData.massUI[ScreenFactory.SCREEN_2][UIData.TYPE_TF]);
			if (massTFs) {
				// размещаем Текстовые поля, если они есть
			}
		}
		
		/**
		 * Обработка нажатия кнопки 1
		 * @param	e
		 */
		private function onBtn1Touch(e:TouchEvent):void
		{
			
			var touch:Touch = e.getTouch((uis[0] as BtnYellow));
			
			if(touch)
			{
				if(touch.phase == TouchPhase.ENDED){
					// сохраняем сообщение
					uiData.mess = "this is text 1";
					// удаляем обработчик
					(uis[0]  as BtnYellow).removeEventListener(TouchEvent.TOUCH, onBtn1Touch);
					// исчезновение экрана
					Disappearance();
				}
			}
 
		}
		
		/**
		 * Обработка нажатия кнопки 2
		 * @param	e
		 */
		private function onBtn2Touch(e:TouchEvent):void
		{
			
			var touch:Touch = e.getTouch((uis[1] as BtnYellow));
			
			if(touch)
			{
				if (touch.phase == TouchPhase.ENDED) {
					// сохраняем сообщение	
					uiData.mess = "this is text 2";
					(uis[1]  as BtnYellow).removeEventListener(TouchEvent.TOUCH, onBtn2Touch);
					// исчезновение экрана
					Disappearance();
					
				}
			}
 
		}
	}

}