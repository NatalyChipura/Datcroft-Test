package chipura.screens 
{
	/**
	 * Класс фабрики экранов
	 * @author Наталья Чипура NatalyChipura@gmail.com
	 */
	public class ScreenFactory extends AScreenCreator 
	{
		public static const SCREEN_SPLASH:String = "SCSplash";
		public static const SCREEN_1:String = "SCScene1";
		public static const SCREEN_2:String = "SCScene2";
		public static const SCREEN_3:String = "SCScene3";

		
		public function ScreenFactory() 
		{
			super();
		}
		
		/**
		 * Создать экрна
		 * @param	type тип экрана
		 * @return экземпляр экрана
		 */
		override protected function createScreen(type:String):AScreen
		{
			switch(type){
				case SCREEN_SPLASH: {
					return new ScreenSplash();
				} break;
				case SCREEN_1: {
					return new Scene1Class();
				} break;
				case SCREEN_2: {
					return new Scene2Class();
				} break;
				case SCREEN_3: {
					return new Scene3Class();
				} break;
				default: {
					throw new Error("Invalid Screen set");
					return null;
				}
			}
		}
		
	}

}