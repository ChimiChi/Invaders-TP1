package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author ...
 */
class TitleScreen extends FlxState 
{
	private var title:FlxText;
	override public function create():Void 
	{
		super.create();
		title = new FlxText(FlxG.camera.width / 2 - 80, FlxG.camera.height / 2 - 10, 0, "FONSO(las bolas)", 15);
		add(title);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.ENTER)
		{
			FlxG.switchState(new PlayState());
		}
	}
	
}