package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Ana
 */
class Wachin extends FlxSprite 
{

	private var peew:Peew;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		x -= width / 2;
		y -= height;
		
		peew = new Peew();
		peew.kill();
		FlxG.state.add(peew);
		
	}
	
	override public function update(elapsed:Float):Void{
		
		super.update(elapsed);
		
		movement();
		checkboundaries();
		peewpeew();
		
	
	}
	
	private function movement():Void{
		
		if (FlxG.keys.pressed.D)
		{
			x += 4 * FlxG.elapsed * FlxG.updateFramerate;
		}
		if (FlxG.keys.pressed.A)
		{
			x -= 4 * FlxG.elapsed* FlxG.updateFramerate;
		}
			
	}
	
	private function checkboundaries():Void
	{
			if (x < 0)
		{
			x = 0;
		}	
		else if (x > FlxG.width - width)
		{
			x = FlxG.width - width;
		}
	}
	
	private function peewpeew():Void
	{
		if (FlxG.keys.justPressed.UP && peew.alive == false)
		{
			peew.reset(x + width / 2, y + height / 2);
			peew.velocity.y = -70;
		}
		
	}
}