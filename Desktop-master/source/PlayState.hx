package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var text:FlxText;
	var sprite:FlxSprite;
	var grid:FlxSprite;

	override public function create()
	{
		super.create();

		// I looked up image on google and this was the first result.
		// Makes a sprite at X: 100, Y: 0
		sprite = new FlxSprite(100, 0);
		sprite.loadGraphic(AssetPaths.Image__png);

		// Makes a sprite at X: 100, Y: 0
		grid = new FlxSprite(100, 0);
		grid.makeGraphic(300, 300, flixel.util.FlxColor.WHITE);
		// Pixel Perfect Rendering so the grid doesn't look wonky.
		grid.pixelPerfectRender = true;

		// Set the grid pixels.
		for (y in 0...Std.int(grid.width))
		{
			for (x in 0...Std.int(grid.height))
			{
				if (x % 2 == 1 && y % 2 == 1)
					grid.pixels.setPixel(x, y, 0x0000ff);
				if (x < 5 || y < 5 || x > 295 || y > 295)
					grid.pixels.setPixel(x, y, 0xffffff);
			}
		}

		// Creates text saying "Hello World" in the middle of the screen in red text.
		text = new FlxText(0, 0, FlxG.width, "Hello World", 64);
		text.setFormat(null, 64, FlxColor.RED, FlxTextAlign.CENTER);

		add(text);
		add(sprite);
		add(grid);
	}

	override public function update(elapsed:Float):Void // Moves the text along the y axis to the bottom of the screen.
	{
		super.update(elapsed);

		// Moves the text 1 pixel down.
		text.y++;
		// Moves the sprite and grid 1 pixel down.
		sprite.x++;
		grid.x++;

		// Brings things back to screen if they are offscreen.
		if (text.y > FlxG.height)
			text.y = 0 - 64;

		if (sprite.x > FlxG.height)
			sprite.x = 0 - 64;

		if (grid.x > FlxG.height)
			grid.x = 0 - 64;
	}
}
