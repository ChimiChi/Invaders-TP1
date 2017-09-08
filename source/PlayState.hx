package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	private var wachin:Wachin;
	
	override public function create():Void
	{
		super.create();
		
		FlxG.cameras.bgColor = 0xff96ceb4;
		wachin = new Wachin(FlxG.width / 2, FlxG.height, AssetPaths.wachin__png);
		
		add(wachin);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
			
	}
}