event_inherited()


//vida do boss

vida_maxima=3;
vida_atual=vida_maxima;

//velocidades 
max_velh=3;
max_velh=3;


timer_estado= 0;

ataque =1;



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
	//Checando se o plaayer está na tela 
	
	
	
	if(instance_exists(obj_player))
	{
		//se o player estiver perto do boss 
		
		var _dist=point_distance(x, y, obj_player.x, obj_player.y);
		if(_dist<300){
				troca_estado(estado_walk);
		}

	}
		
}

#endregion

#region //esado_walk
estado_walk.inicia=function()
{
	//esse estado de caçar o playe
	//definindo a sprite
	sprite_index=spr_boss_walk_front;
	
	//iniciar animação no começo 
	image_index=0;

	
	
}

estado_walk.roda=function()
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
	
	if(_dist>40)
	{
		//definindo minha velocidade 
		velh=lengthdir_x(max_velh, _dir)
	}
	else
	{
		velh=0;
		troca_estado(estado_attack);
	}
}
#endregion

#region //esado_hurt
estado_hurt.inicia=function()
{
	//definindo a sprite
	sprite_index=spr_boss_left_hit;
	
	//iniciar animação no começo 
	image_index=0;
	
	//perdendo vida
	vida_atual--;
}

estado_hurt.roda=function()
{
 
	//saindo do estado hurt
	//checando se a animação acabou 
	if(image_index>=image_number-.5)
{	
	if (vida_atual>0)
	{
		troca_estado(estado_walk);
	}
	else
	{
		troca_estado(estado_death);
	}
	
}
	

}
#endregion

#region //esado_death
estado_death.inicia=function()
{
	//definindo a sprite
	sprite_index=spr_boss_death;
	
	//iniciar animação no começo 
	image_index=0;
}

estado_death.roda=function()
{
	if(image_index>=image_number-.5)
	{
		instance_destroy();
	}

}
#endregion

#region //esado_attack
estado_attack.inicia=function()
{
	//definindo a sprite
	sprite_index=spr_boss_attack_front;	
	
	//iniciar animação no começo 
	image_index=0;
}

estado_attack.roda=function()
{
	if (image_index >=image_number-.5)
	{
		troca_estado(estado_idle);
	}
	
}

#endregion
