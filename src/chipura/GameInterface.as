package chipura 
{
	import chipura.assets.AssetsConst;
	import chipura.screens.AScreen;
	import chipura.screens.ScreenFactory;

	import starling.display.Sprite;
	import starling.events.Event;

	/**
	 * Класс интерфейса игры
	 * @author Наталья Чипура natalychipura@gmail.com
	 */
	public class GameInterface extends Sprite 
	{
		// панель для генерации и отображения экранов
		private var panel:ScreenFactory;
		
		public function GameInterface() 
		{
			super();
			init();
		}
		
		/**
		 * Инициализация игры
		 */
		public function init():void
		{
			// добавляем панель экранов
			panel = new ScreenFactory();
			addChild(panel);
			
			// Устанавливаем 1 экран для отображения
			panel.setScreen(ScreenFactory.SCREEN_1);
			
			panel.addEventListener(AssetsConst.EVENT_SCREEN_HIDE, onStart);
		}
		
		/**
		 * Обработка события при нажатии кнопки Start на экране 1
		 * @param	e
		 */
		private function onStart(e:Event):void 
		{
			panel.removeEventListener(AssetsConst.EVENT_SCREEN_HIDE, onStart);
			// устанавливаем экран 2
			panel.setScreen(ScreenFactory.SCREEN_2);
			panel.addEventListener(AssetsConst.EVENT_SCREEN_HIDE, onShowMess);
		}
		
		/**
		 * Обработка события нажатия кноки выбора сообщения на экране 2
		 * @param	e
		 */
		private function onShowMess(e:Event):void 
		{
			panel.removeEventListener(AssetsConst.EVENT_SCREEN_HIDE, onShowMess);
			// устанавливаем экран 3
			panel.setScreen(ScreenFactory.SCREEN_3);
		}
	}

}