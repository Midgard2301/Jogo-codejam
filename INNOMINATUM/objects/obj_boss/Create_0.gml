event_inherited()

//vida do boss
vida=3;

dano=noone;

//velocidades 
max_velh=3;

timer_estado= 0;

vida_player=obj_player.vida;

#region //estado_idle
estado_idle.inicia=function()
{
	//logica do estado 
	//definindo a sprite
	sprite_index=spr_boss_idle_front;
		
	//iniciar animação no começo 
	image_index=0;
}

estado_idle.roda=function()
{
	//Checando se o player está na tela 
	
	if(instance_exists(obj_player) && vida_player>0)
	{
		//se o player estiver perto do boss 
		
		var _dist=point_distance(x, y, obj_player.x, obj_player.y);
		if(_dist<300){
				troca_estado(estado_hunt);
		}
	}
}

#endregion

#region //estado_hunt
estado_hunt.inicia=function()
{
	//esse estado de caçar o playe
	//definindo a sprite
	sprite_index=spr_boss_walk_front;
	
	//iniciar animação no começo 
	image_index=0;
}

estado_hunt.roda=function()
{
	if(!instance_exists(obj_player)	)
	{	
		troca_estado(estado_idle);
		return;
	}
		
	var _dir =point_direction(x, y, obj_player.x, obj_player.y);
	//distância do player 
	var _dist=point_distance(x, y, obj_player.x, obj_player.y);
	
	mp_potential_step_object(obj_player.x,obj_player.y,1,obj_colisor);
	
	if(_dist>20)
	{
		//definindo minha velocidade 
		velh=lengthdir_x(max_velh, _dir)
	}
	else
	{
		velh=0;
		troca_estado(estado_attack);
	}
	
	//definindo o xscale com base no destino x
	xscale= sign(x-obj_player.x);
}
#endregion

#region //estado_hurt
estado_hurt.inicia=function()
{
	//definindo a sprite
	sprite_index=spr_boss_hit;
	
	//iniciar animação no começo 
	image_index=0;
	
	//perdendo vida
	vida--;
}

estado_hurt.roda=function()
{
 
	//saindo do estado hurt
	//checando se a animação acabou 
	if(image_index>=image_number-.5)
{	
	if (vida>0)
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
estado_death.inicia=function()
{
	//definindo a sprite
	sprite_index=spr_boss_death;
	
	//iniciar animação no começo 
	image_index=0;
}

estado_death.roda=function()
{	
	instance_destroy(obj_tiro);
	
	if(image_index >= image_number-.5)
	{
		instance_destroy();
	}
	
	//vida=3; essa variável estava ressucitando o boss ent comentei ela ok?
}
#endregion

#region //estado attack
estado_attack.inicia=function()
{
	//definindo a sprite
	sprite_index=spr_boss_attack_front;	
	
	//iniciar animação no começo 
	image_index=0;
}

estado_attack.roda=function()
{	
	if(dano == noone && vida_player>0 && image_index >= 2)
	{
		dano=instance_create_depth(x,y, depth, obj_dano_inimigo);
	}
	
	if (image_index >= image_number-.5)
	{
		troca_estado(estado_hunt);
	}
}
estado_attack.finaliza=function(){
	if(instance_exists(dano))
	{
		instance_destroy(dano);
	}
	
	dano = noone;
}



#endregion

dir=xscale;
