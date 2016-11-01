package chipura.UI 
{
	import chipura.MainClass;
	
	/**
	 * Класс Жёлтого текстового поля
	 * @author Наталья Чипура NatalyChipura@gmail.com
	 */
	public class TFieldYellow extends ATFieldClass 
	{
		
		public function TFieldYellow(str:String) 
		{
			super(MainClass.getInstance().textureTFYellow,str,0x633017);
			
		}
		
	}

}