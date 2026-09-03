//criando um timer para mudar de direção 
	tempo_estado=game_get_speed(gamespeed_fps)*2	;
	timer_estado= tempo_estado;

	//escolhendo um local no mapa e indo até ele 
	destino_x=0;
	destino_y=0;
	
	alvo=noone;
// Inherit the parent event
event_inherited();

//tudo que eu esvrever a baixo desse código event_inherited(); é sobrescrito


//estado persegue

estado_hunt=new estado();

#region //estado_idle
estado_idle.inicia=function()
{
	//definindo a sprite
	sprite_index=spr_slime_idle;
	
	//iniciar animação no começo 
	image_index=0;
	
	timer_estado=tempo_estado;
	
	image_blend=c_white;
	
}

estado_idle.roda=function()
{
	//diminuindo timer 
	timer_estado--;
	
	var _tempo= random(timer_estado); 
	
	if(_tempo<= tempo_estado*0.001)
	{
		var _estado=choose(estado_idle, estado_walk, estado_walk);
		troca_estado(estado_walk);
	}
		
}

#endregion

#region //esado_walk
estado_walk.inicia=function()
{
	//definindo a sprite
	sprite_index=spr_slime_walk;
	
	//iniciar animação no começo 
	image_index=0;
	
	//resetando o timer do estado
	timer_estado=tempo_estado;
	
	//escolhendo um local no mapa e indo até ele 
	destino_x=irandom(room_width);
	destino_y=irandom(room_height);
	
	//definindo o xscale com base no destino x
	xscale= sign(destino_x-x);
	
}

estado_walk.roda=function()
{

	timer_estado--;
		var _tempo= random(timer_estado); 
	if(_tempo<=5)
	{
		var _estado_novo=choose(estado_idle, estado_walk)
		//troca_estado(estado_idle);
	}
	
	
	//indo até o meu destino enquanto desvio de obstáculos 
	mp_potential_step_object(destino_x, destino_y, 1,obj_colisor);
	
	
}
#endregion

#region //esado_hurt
estado_hurt.inicia=function()
{
	//definindo a sprite
	sprite_index=spr_slime_hurt;
	
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

#region //esado_death
estado_death.inicia=function()
{
	//definindo a sprite
	sprite_index=spr_slime_death;
	
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
	sprite_index=spr_slime_attack;
	
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

estado_attack.finaliza=function()
{
alvo=noone
}

#endregion

#region //estado_hunt

estado_hunt.inicia=function()
{
	sprite_index=spr_slime_walk;
	image_index=0;
	
	image_blend=c_yellow
	if(instance_exists(obj_player)	)
	{
		alvo=obj_player.id;
	}
	

}

estado_hunt.roda= function(){
	if(!instance_exists(obj_player)	)
	{
		alvo=noone;
		troca_estado(estado_idle);
	}
	
	
	mp_potential_step_object(alvo.x,alvo.y,1,obj_colisor);
	
	//Atacando o Player 
	//checando a distância para o player 
	var _dist=point_distance(x,y, alvo.x,alvo.y);
	
	if (_dist <=10){
		troca_estado(estado_attack);
	}
	
	
	//definindo o xscale com base no destino x
	xscale= sign(alvo.x-x);
	
	
	//Avisando os outros inimigos 
	//Checando os inimigos na tela 
	
	var _n=instance_number(object_index);
	
	//passando por todos os obj iguais a mim 
	
	for (var i=0; i<_n;i++)
	{
		//Checando se eu não estou olhando para eu mesmo 
		var _slime= instance_find(object_index, i);	 
		
		if(_slime==id)
		{
			// eu me achei ou seja não faço nada
		}
		else 
		{
			//verificar se o outro inimigo está perseguindo o player
			if(_slime.alvo!=alvo)
			{
				//Checando a distância desse slime
				var _dist =point_distance(x,y,_slime.x,_slime.y);
				if(_dist<=100)
				{
				// Mudando o estado do inimigo para perseguir o player
					with(_slime)
					{
						troca_estado(estado_hunt)
					} 
				
				}

			}
		}
	}
	
}

#endregion





