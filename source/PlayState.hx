package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import openfl.display.Sprite;

class PlayState extends FlxState
{
	var text:FlxText;
	var sprite:FlxSprite;

	override public function create()
	{
		super.create();
		text = new FlxText(0, 0, FlxG.width, "Hello World", 64);
		text.setFormat(null, 64, FlxColor.RED, FlxTextAlign.CENTER);
		add(text);
		sprite = new FlxSprite();
		sprite.makeGraphic(300, 300, flixel.util.FlxColor.WHITE);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		text.y++;
		if (text.y > FlxG.height)
			text.y = 0 - 64;
		for (y in 0...300)
		{
			{
				for (x in 0...300)
				{
					if (x % 2 == 1 && y % 2 == 1)
						sprite.pixels.setPixel(x, y, 0x0000ff);
					if (x < 5 || y < 5 || x > 295 || y > 295)
						sprite.pixels.setPixel(x, y, 0xffffff);
				}
			}
		}
		sprite.x += 1;
		if (sprite.x > FlxG.height)
			sprite.x = 0 - 64;

		add(sprite);
	}

	function myCallback():Void {}
}
