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
		FlxG.camera.bgColor = 0xff1090b2;
		title = new FlxText(FlxG.camera.width / 2 - 43, FlxG.camera.height / 2 - 10, 0, "FONSO", 20);
		title.color = 0xffff942f;
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