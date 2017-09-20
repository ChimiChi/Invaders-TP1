package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author ...
 */
class CreditScreen extends FlxState
{

private var name1:FlxText;
private var name2:FlxText;
private var name3:FlxText;
private var timerCredits:Float = 0;

	override public function create():Void 
	{
		super.create();
		FlxG.camera.bgColor = 0xff48d8ff;
		name1 = new FlxText(FlxG.camera.width / 2 - 80, FlxG.camera.height / 2 - 50, 0, "Ana Belén Taborcías", 8);
		name2 = new FlxText(FlxG.camera.width / 2 - 80, FlxG.camera.height / 2 - 30, 0, "Beto Castro", 8);
		name3 = new FlxText(FlxG.camera.width / 2 - 80, FlxG.camera.height / 2 - 10, 0, "Enrique Alarcón", 8);
		name1.color = 0xffb25700;
		name2.color = 0xffb25700;
		name3.color = 0xffb25700;
		add(name1);
		add(name2);
		add(name3);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		timerCredits += elapsed;
		
		if (timerCredits >= 5)
		{
			FlxG.switchState(new TitleScreen());
		}
	}
}