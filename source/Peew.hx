package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Ana
 */
class Peew extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);

		makeGraphic(1, 2, 0xffffffff);
		velocity.y = -70;
		

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (y < 10 || y > FlxG.height - 10)
		{
			kill();
		}

	}
}