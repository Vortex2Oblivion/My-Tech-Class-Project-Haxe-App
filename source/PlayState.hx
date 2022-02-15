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

		sprite = new FlxSprite(100, 0);
		sprite.loadGraphic(AssetPaths.Image__png);

		grid = new FlxSprite(100, 0);
		grid.makeGraphic(300, 300, flixel.util.FlxColor.WHITE);
		grid.pixelPerfectRender = true;

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

		text = new FlxText(0, 0, FlxG.width, "Hello World", 64);
		text.setFormat(null, 64, FlxColor.RED, FlxTextAlign.CENTER);

		add(text);
		add(sprite);
		add(grid);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		text.y++;
		sprite.x++;
		grid.x++;

		if (text.y > FlxG.height)
			text.y = 0 - 64;

		if (sprite.x > FlxG.height)
			sprite.x = 0 - 64;

		if (grid.x > FlxG.height)
			grid.x = 0 - 64;
	}

	function myCallback():Void {}
}
