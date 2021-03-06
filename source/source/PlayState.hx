package;

import deengames.planetoid.entity.Player;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

import nebula.ecs.Container;
import nebula.ecs.Entity;

import nebula.ecs.component.SpriteComponent;
import nebula.ecs.component.PositionComponent;

import deengames.planetoid.system.MouseShootSystem;

class PlayState extends FlxState
{
	private var container:Container = new Container();
    
	override public function create():Void
	{
		super.create();
        container.addDefaultSystems(this);
        container.addSystem(new MouseShootSystem(this));

        var background:Entity = new Entity().add(new PositionComponent(0, 0))
        									.add(new SpriteComponent('assets/images/background.jpg',true));
        
        Player.create();
        

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
        container.update(elapsed);
	}
}
