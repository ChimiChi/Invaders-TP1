package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Beto Castro
 */
class Shields extends FlxSprite 
{	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);		
		
		makeGraphic(1, 1, 0xffffffff);
	}
	
	override public function update(elapsed:Float):Void
	{

	}
	
}