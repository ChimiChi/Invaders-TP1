package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxRandom;

class PlayState extends FlxState
{
	private var fonso:Fonso;
	private var wachin:Wachin;
	private var malitos:FlxTypedGroup<Malitos>;
	private var shootTime:Float;
	private var timer:Float = 0;
	private var randomNum:FlxRandom = new FlxRandom();
	private var win:FlxText;
	private var lose:FlxText;
	private var timerFonso:Float = 0;
	
	override public function create():Void
	{
		super.create();
		
		FlxG.cameras.bgColor = 0xff96ceb4;
		wachin = new Wachin(FlxG.width / 2, FlxG.height, AssetPaths.wachin__png);
		win = new FlxText(21, 30, 0, "YOU WIN", 20);
		win.color = 0xff88d8b0;
		win.kill();
		lose = new FlxText(21, 30, 0, "YOU LOSE", 20);
		lose.color = 0xffff6f69;
		lose.kill();
		malitos = new FlxTypedGroup<Malitos>();
		fonso = new Fonso(0, 0, AssetPaths.fonso__png);
		fonso.kill();
		
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
		add(fonso);
		add(win);
		add(lose);
		
		
		
		shootTime = 0.5 + randomNum.float(1.5);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		timerFonso += elapsed;
		if (timerFonso >= 8)
		{
			fonso.reset( -fonso.width, 2);
			movementFoso();
			timerFonso = 0;
		}
		
		if (malitos.length > 0 && malitos.alive)
		{
			timer += elapsed;
			if (timer >= shootTime)
			{
				var num:Int = randomNum.int(0, malitos.length-1);
				malitos.members[num].shoot();
				timer = 0;
			}
		}
		else 
		{
			win.revive();
			lose.kill();
			FlxG.cameras.bgColor = 0xffffeead;
		}
		for (i in malitos)
		{
			if (FlxG.overlap(wachin.peew, i))
			{
				malitos.remove(i, true);
				wachin.peew.kill();
						
			}
			
			if (FlxG.overlap(i.bullet, wachin))
			{
				wachin.kill();
				i.bullet.kill();
				lose.revive();
				win.kill();
				FlxG.cameras.bgColor = 0xffffeead;
				malitos.kill();
				
			}
			
			if (FlxG.overlap(i, wachin))
			{
				wachin.kill();
				malitos.remove(i, true);
				lose.revive();
				win.kill();
				FlxG.cameras.bgColor = 0xffffeead;
				malitos.kill();
			}
		}
	}
	
	public function movementFoso():Void
	{
		fonso.velocity.x = 30;
	}
}