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
		name1 = new FlxText(FlxG.camera.width / 2 - 80, FlxG.camera.height / 2 - 50, 0, "Ana Belén Taborcías", 7);
		name2 = new FlxText(FlxG.camera.width / 2 - 80, FlxG.camera.height / 2 - 30, 0, "Beto Castro", 7);
		name3 = new FlxText(FlxG.camera.width / 2 - 80, FlxG.camera.height / 2 - 10, 0, "Enrique Alarcón", 7);
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