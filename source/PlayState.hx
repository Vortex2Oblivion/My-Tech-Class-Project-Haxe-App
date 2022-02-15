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
		// I looked up image on google and this was the first result.
		// Creates a sprite and sets the x and y pos to 300
		sprite = new FlxSprite();
		sprite.makeGraphic(300, 300, flixel.util.FlxColor.WHITE);
		sprite.loadGraphic(AssetPaths.Image__png);
		// Creates a sprite and moves it to x 100 and y o.
		sprite.x = 100;
		sprite.y = 0;
		super.create();
		// Creates text saying "Hello World" in the middle of the screen in red text.
		text = new FlxText(0, 0, FlxG.width, "Hello World", 64);
		text.setFormat(null, 64, FlxColor.RED, FlxTextAlign.CENTER);
		add(text);
	}

	override public function update(elapsed:Float):Void // Moves the text along the y axis to the bottom of the screen.
	{
		super.update(elapsed);
		text.y++;
		// Brings the text back to the top.
		if (text.y > FlxG.height)
			text.y = 0 - 64;
		for (y in 0...300)
			// Makes a white and blue checker board.
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
		// Same thing as the text but sprite.
		sprite.x += 1;
		if (sprite.x > FlxG.height)
			sprite.x = 0 - 64;

		add(sprite);
	}

	function myCallback():Void {}
}
