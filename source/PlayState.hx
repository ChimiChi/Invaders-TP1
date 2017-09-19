package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxRandom;

class PlayState extends FlxState
{
	private var fonso:Fonso;
	private var wachin:Wachin;
	private var malitos:FlxTypedGroup<Malitos>;
	private var walls:FlxTypedGroup<Shields>;
	private var shootTime:Float;
	private var timer:Float = 0;
	private var randomNum:FlxRandom = new FlxRandom();
	private var win:FlxText;
	private var lose:FlxText;
	private var timerFonso:Float = 0;
	private var lineaSup:Linea;
	private var lineaInf:Linea;
	public var alto:Int = 3;
	public var ancho:Int = 20;
	private var score:FlxText;
	private var highScore:FlxText;
	private var timerReset:Float = 0;
	private var arrayLives:FlxTypedGroup<FlxSprite>;
	private var spriteLife:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		
		FlxG.cameras.bgColor = 0xffa0a0a0;
		lineaInf = new Linea(0, FlxG.height - 10);
		lineaSup = new Linea(0, 10);
		
		wachin = new Wachin(FlxG.width / 2, FlxG.height - 10, AssetPaths.Ship__png);
		malitos = new FlxTypedGroup<Malitos>();
		win = new FlxText(21, 30, 0, "YOU WIN", 20);
		win.color = 0xff88d8b0;
		lose = new FlxText(21, 30, 0, "YOU LOSE", 20);
		lose.color = 0xffff6f69;
		fonso = new Fonso(0, 0, AssetPaths.Ovni__png);
		fonso.kill();
		score = new FlxText(FlxG.camera.width - 50, 1, 0, "SCORE 0", 6);
		highScore = new FlxText(FlxG.camera.width / 2 - 40, 1, 0, "HIGH SCORE"+Global.highScore, 6);
		Global.score = 0;
		Global.lives = 3;
		arrayLives = new FlxTypedGroup<FlxSprite>();
		
		// SHIELDS UP!!!
		walls = new FlxTypedGroup<Shields>();
		
		for (i in 0...alto)
		{
			for (j in 0...ancho)
			{
				var cubitos1:Shields = new Shields((((FlxG.width / 2) + j) - ancho / 2) - 48, (FlxG.height - 30 + i) - alto / 2);
				walls.add(cubitos1);
				
				var cubitos2:Shields = new Shields(((FlxG.width / 2) + j) - ancho / 2, (FlxG.height - 30 + i) - alto / 2);
				walls.add(cubitos2);
				
				var cubitos3:Shields = new Shields((((FlxG.width / 2) + j) - ancho / 2) + 48, (FlxG.height - 30 + i) - alto / 2);
				walls.add(cubitos3);				
			}
		}
		add(walls);
		
		for (i in 0...7)
		{
			var malito1:Malitos = new Malitos(10 + 20*i,35,AssetPaths.Alien__png);
			malitos.add(malito1);
			
			var malito2:Malitos = new Malitos(10 + 20*i,25,AssetPaths.Alien1__png);
			malitos.add(malito2);
			
			var malito3:Malitos = new Malitos(10 + 20*i,13,AssetPaths.Alien2__png);
			malitos.add(malito3);
		}
		
		for ( i in 0...Global.lives)
		{
			spriteLife = new FlxSprite(0 + i * 10, 0, AssetPaths.Ship__png);
			spriteLife.scale.x = 0.5;
			spriteLife.scale.y = 0.5;
			arrayLives.add(spriteLife);
		}
		
		add(arrayLives);
		add(lineaSup);
		add(lineaInf);
		add(malitos);
		add(wachin);
		add(fonso);
		add(score);
		add(highScore);
		shootTime = 0.5 + randomNum.float(1.5);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		patronMov();
		colisiones();
		

		timerFonso += elapsed;
		if (timerFonso >= 15)
		{
			fonso.reset( -fonso.width, 12);
			fonso.movementFonso();
			timerFonso = 0;
		}
		trace(timerFonso);
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
		else if(wachin.alive){
			add(win);
			FlxG.cameras.bgColor = 0xffffeead;
		}
		if (Global.lives == 0)
		{
			wachin.kill();
			add(lose);
			malitos.kill();
			timerReset += elapsed;
			if (Global.score > Global.highScore)
			{
			Global.highScore = Global.score;
			highScore.text = "HIGH SCORE " + Global.highScore;
			}
		}
		score.text = "SCORE " + Global.score;
		
		if (timerReset >= 3)
		{
			timerReset = 0;
			FlxG.switchState(new PlayState());
		}
	}
	
	public function patronMov():Void
	{
		for (i in malitos)
		{
			if (i.x <= 0)
			{	
				for (i in malitos)
				{
					i.y += 0.25;
					i.velocity.x = -i.velocity.x;								
				}
			}
			else if (i.x > FlxG.width - 10)
			{
				for (i in malitos)
				{
					i.velocity.x = -i.velocity.x;
					i.moveDown();
				}
			}
		}		
	}
	
	public function colisiones():Void
	{
		// WALLS
		for (i in walls)
		{
			// WALLS VS BALA NAVE
			if (FlxG.overlap(wachin.peew, i))
			{
				walls.remove(i, true);
				wachin.peew.kill();
			}
			// WALLS VS BALA ENEMIGOS
			for ( j in malitos)
			{
				if (FlxG.overlap(i, j.get_bullet()))
				{
					i.destroy();
					j.get_bullet().kill();
				}
			}
		}
		// ENEMIGOS
		for ( i in malitos)
		{
			// BALA NAVE CONTRA ENEMIGO
			if (FlxG.overlap(i, wachin.peew))
			{
				i.destroy();
				malitos.remove(i, true);
				wachin.peew.kill();
				Global.score += 5;
			}
			// BALA ENEMIGO CONTRA NAVE
			if (FlxG.overlap(i.get_bullet(), wachin))
			{
				i.get_bullet().kill();
				Global.lives --;
				arrayLives.remove(arrayLives.getFirstAlive(), true);
			}
			// CHOQUE MALO CONTRA NAVE
			if (FlxG.overlap(i, wachin))
			{
				wachin.kill();
				malitos.remove(i, true);
				FlxG.cameras.bgColor = 0xffffeead;
				malitos.kill();
				add(lose);
			}
		}
		//BALA CONTRA OVNI
		if (FlxG.overlap(wachin.peew, fonso))
		{
			fonso.kill();
			wachin.peew.kill();
			Global.score += 20;
		}
	}
	
	public function increaseVel():Void
	{
		for (i in malitos)
		{
			switch (malitos.length)
			{
				case 10: i.velocity.x = 20;
				case 5: i.velocity.x = 30;
				case 1: i.velocity.x = 40;
				default: i.velocity.x = i.velocity.x;
			}
		}		
	}
}