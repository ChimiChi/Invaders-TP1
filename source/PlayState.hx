package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	private var wachin:Wachin;
	private var malitos:FlxTypedGroup<Malitos>;
	
	override public function create():Void
	{
		super.create();
		
		FlxG.cameras.bgColor = 0xff96ceb4;
		wachin = new Wachin(FlxG.width / 2, FlxG.height, AssetPaths.wachin__png);
		malitos = new FlxTypedGroup<Malitos>();
		
		for (i in 0...5)
		{
			var malito1:Malitos = new Malitos(10 + 30*i,50,AssetPaths.malo__png);
			malitos.add(malito1);
		}
		add(malitos);
		add(wachin);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
			
	}
}