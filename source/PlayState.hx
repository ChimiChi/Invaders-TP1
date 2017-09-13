package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import haxe.Timer;
import neko.Random;

class PlayState extends FlxState
{
	
	private var wachin:Wachin;
	private var malitos:FlxTypedGroup<Malitos>;
	private var shootTimer:Timer;
	private var shootTime:Int;
	private var randomNum:Random = new Random();
	
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
			
			var malito2:Malitos = new Malitos(10 + 30*i,30,AssetPaths.malo__png);
			malitos.add(malito2);
			
			var malito3:Malitos = new Malitos(10 + 30*i,10,AssetPaths.malo__png);
			malitos.add(malito3);
		}
		
		add(malitos);
		add(wachin);
		
		
		
		shootTime = 500 + randomNum.int(1500);
		shootTimer = new Timer(shootTime);
		shootTimer.run = function ()
		{
			if (malitos.alive)
			{
				malitos.getRandom().shoot();
			}
			
		};
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		for (i in malitos)
		{
			if (FlxG.overlap(wachin.peew, i))
			{
				i.kill();
				wachin.peew.kill();
				
			}
			
			if (FlxG.overlap(i.bullet, wachin))
			{
				wachin.kill();
				i.bullet.kill();
			}
			
			if (FlxG.overlap(i, wachin))
			{
				wachin.kill();
				i.kill();
			}
		}
	}
}