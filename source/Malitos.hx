package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Malitos extends FlxSprite 
{
	public var bullet(get, null):Peew;
	public var xVel:Int = 2;
	public var timerVel:Float = 0;
	public var alienSpeed:Float = 0.2;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		x -= width / 2;
		
		bullet = new Peew();
		bullet.kill();
		FlxG.state.add(bullet);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		timerVel += elapsed;
		
		if (timerVel >= alienSpeed)
		{
			x += xVel;
			timerVel = 0;
		}
		
		
	}
	
	public function moveDown():Void
	{
		y += 5;
	}
	
	public function shoot():Void
	{
		bullet.reset(x + width / 2, y + height / 2);
		bullet.velocity.y = 70;		
	}
	
	public function get_bullet():Peew 
	{
		return bullet;
	}
}