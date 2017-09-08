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

		loadGraphic(AssetPaths.peew__png);
		velocity.y = -70;
		

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (x < 0 || x > FlxG.width || y < 0 || y > FlxG.height)
		{
			kill();
		}

	}
}