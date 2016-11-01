package chipura.UI 
{
	import flash.geom.Point;
	/**
	 * Класс структуры хранения данных UI объектов
	 * @author Наталья Чипура NatalyChipura@gmail.com
	 */
	public class UIData 
	{
		/**
		 * Тип UI элемента Кнока
		 */
		public static const TYPE_BTN:String = "DataButtons";
		/**
		 * Тип UI элемента Текстовое Поле
		 */
		public static const TYPE_TF:String = "DataTextFields";
		
		/**
		 * Набор Заголовков или сообщений
		 */
		public var titles:Vector.<String>;
		/**
		 * Набор Позиций
		 */
		public var positions:Vector.<Point>;
	
		public function UIData (massTitle:Vector.<String>, massPos:Vector.<Point>) 
		{
			titles = massTitle;
			positions = massPos;
		}
	}

}