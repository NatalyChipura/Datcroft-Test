package chipura.screens 
{
	import chipura.assets.AssetsConst;
	import chipura.MainClass;
	import chipura.UI.AButtonClass;
	import chipura.UI.ATFieldClass;
	import chipura.UI.BtnYellow;
	import chipura.UI.TFieldYellow;
	import chipura.UI.UIData;

	import flash.geom.Point;

	import starling.display.MovieClip;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.TextureAtlas;
	
	import starling.core.Starling;

	/**
	 * Класс экрана 3 
	 * @author Наталья Чипура NatalyChipura@gmail.com
	 */
	internal class Scene3Class  extends AScreen 
	{
		
		public function Scene3Class () 
		{
			// показ экрна постоянно, время появления SCREEN_TIMEAPPEAR
			super(AScreen.SCREEN_SHOW_FOREVER, AssetsConst.SCREEN_TIMEAPPEAR);
		}
		
		/**
		 * Инициализация эрана
		 */
		override protected function init():void 
		{		
			// Устанавливаем текстуру фона экрана
			var fonScreen : MovieClip = new MovieClip(uiData.textureScreens.getTextures("Scene3Instance"), 1);
			addChild(fonScreen);
			Starling.juggler.add(fonScreen);
			
			// Обрабатываем массив UI элементов тестовых полей
			var massTF:UIData = UIData(uiData.massUI[ScreenFactory.SCREEN_3][UIData.TYPE_TF]);
			if(massTF){
				var titles:Vector.<String> = massTF.titles;
				var pos:Vector.<Point> = massTF.positions;
			
				for (var key:uint in titles){
					var tf:ATFieldClass = new TFieldYellow(uiData.mess);
					var pt:Point = pos[key] as Point;
					tf.x = pt.x;
					tf.y = pt.y;
					addChild(tf);
					uis.push(tf);
				}	
			}
			
			// Обрабатываем массив UI элементов кнопок
			var massBTNs:UIData = UIData(uiData.massUI[ScreenFactory.SCREEN_2][UIData.TYPE_BTN]);
			if (massBTNs) {
				trace("размещаем Кнопки, если они есть");
			}
			
		}
		
	}

}