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
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	
		velocity.y = 2;	
		
		bullet = new Peew();
		bullet.kill();
		FlxG.state.add(bullet);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);	
	}
	
	public function shoot():Void
	{
		bullet.reset(x + width / 2, y + height / 2);
		bullet.velocity.y = 70;		
	}
	
	function get_bullet():Peew 
	{
		return bullet;
	}
}