event_inherited();

vida = 10;

dano = noone;

max_velh = 3;

vida_player = obj_player.vida;

sprite = 
{
	idle: spr_boss2_idle,
	walk: spr_boss2_walk_side,
	hit: spr_boss2_hit,
	death: spr_boss2_death,
	attack: spr_boss2_attack
};

#region //estado_idle
estado_idle.inicia = function()
{
	sprite_index = sprite.idle;
	
	image_index = 0;
}

estado_idle.roda = function()
{
	if(instance_exists(obj_player) && vida_player > 0)
	{
		var _dist = point_distance(x, y, obj_player.x, obj_player.y);
		
		if(_dist < 300)
		{
			troca_estado(estado_hunt);
		}
	}
}

#endregion

#region //estado_hurt
estado_hurt.inicia = function()
{
	sprite_index = sprite.hit;
	
	image_index = 0;
	
	vida -= 5;
}

estado_hurt.roda = function()
{
	if(image_index >= image_number - .5)
	{
		if(vida > 0)
		{
			troca_estado(estado_hunt);
		}
		else
		{
			troca_estado(estado_death);
		}
	}
}
#endregion

#region //estado_death
estado_death.inicia = function()
{
	sprite_index = sprite.death;
	
	image_index = 0;
}
estado_death.roda = function()
{
	instance_destroy(obj_tiro);
	
	if(image_index >= image_number - .5)
	{
		instance_destroy();
	}
}
#endregion

#region //estado_attack
estado_attack.inicia = function()
{
	sprite_index = sprite.attack;
	
	image_index = 0;
}
estado_attack.roda = function()
{
	if(dano == noone && vida_player > 0 && image_index >= 2)
	{
		dano = instance_create_depth(x, y, depth, obj_dano_inimigo);
	}
	
	if(image_index >= image_number - .5)
	{
		troca_estado(estado_hunt);
	}
}
estado_attack.finaliza = function()
{
	if(instance_exists(dano))
	{
		instance_destroy(dano);
	}
	
	dano = noone;
}
#endregion

#region //estado_hunt
estado_hunt.inicia = function()
{
	sprite_index = sprite.walk;
	
	image_index = 0;
}

estado_hunt.roda = function()
{
	if(!instance_exists(obj_player))
	{
		troca_estado(estado_idle);
		return;
	}
	
	var _dir = point_direction(x, y, obj_player.x, obj_player.y);
	
	var _dist = point_distance(x, y, obj_player.x, obj_player.y);
	
	mp_potential_step_object(obj_player.x, obj_player.y, 1, obj_colisor);
	
	if(_dist > 20)
	{
		velh = lengthdir_x(max_velh, _dir);
	}
	else
	{
		velh = 0;
		troca_estado(estado_attack);
	}
	
	xscale = sign(obj_player.x - x);
}
#endregion
