package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author ...
 */
class TitleScreen extends FlxState 
{
	private var title:FlxText;
	private var fondo:FlxSprite;
	private var invaders:FlxText;
	private var enter:FlxText;
	private var cont:FlxText;
	
	override public function create():Void 
	{
		super.create();
		fondo = new FlxSprite(0, 0, AssetPaths.fonso__png);
		title = new FlxText(0, 0, 0, "FONSO", 15);
		invaders = new FlxText(75, 0, 0, "INVADERS", 14);
		enter = new FlxText(0, 50, 0, "Press Enter", 7);
		cont = new FlxText(103, 50, 0, "To Continue", 7);
		title.color = 0xffff942f;
		invaders.color = 0xffff942f;
		enter.color = 0xffff942f;
		cont.color = 0xffff942f;
		add(fondo);
		add(title);
		add(invaders);
		add(enter);
		add(cont);
		
		
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