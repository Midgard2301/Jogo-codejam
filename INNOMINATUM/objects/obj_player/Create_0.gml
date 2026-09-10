//Iniciar variáveis
mask_index = spr_player_idle_front;

// Define o tamanho da janela (Largura, Altura) em pixels
window_set_size(640, 360);  

// Centraliza a janela na sua tela
window_center();

meu_dano=noone;

#region // iniciando estados
//iniciando primeiro estado 
estado_idle= new estado();

//iniciando estado walk 
estado_walk=new estado();

//iniciando o estado de ataque 
estado_attack = new estado();

//estado de tiro
estado_tiro= new estado();
#endregion

#region //estado idle
//Meu estado _idle precissa de um inicio 
estado_idle.inicia=function()
{ 
	//Definindo a sprite atual com base na direção que eu tô olhando
	var _sprite=definindo_sprite(dir,  spr_player_walk_side,spr_player_walk_front, spr_player_walk_back);
	
	//ajustando o sprite  
	sprite_index=_sprite;
	
	//garantindo que a animação começo no primeiro frame 
	image_index=0;
}

estado_idle.roda=function()
{
 //se eu estiver em movimento 
 if (up xor left or right xor down)
 {
	troca_estado(estado_walk);
 }
 
 // condição de attack 
 if (attack)
 {
 troca_estado(estado_attack);
 }
 
 if(tiro){
 troca_estado(estado_tiro);
 }
}
#endregion

#region //estado walk 

estado_walk.inicia= function()
{
	dir=(point_direction(0, 0, right-left, down-up )div 90);
	//definindo a sprite 

	//configurando a sprit 
	sprite_index=definindo_sprite(dir, spr_player_walk_side,spr_player_walk_front, spr_player_walk_back);
	
	//começando  a animação do começo 
	image_index=0;
}


estado_walk.roda = function() {
		
	velv=(down-up)*vel;
	velh=(right-left)*vel;
    
	
	if (velh == 0 && velv == 0) {
        troca_estado(estado_idle);
		return;
    }
	
	dir = (point_direction(0, 0, velh, velv) div 90);
	//Ajustando o lado que ele olha 
	if (velh!=0)
	{
		var _novo_scale = sign(velh);
		
		// Se ele mudou de direção
		if (image_xscale != _novo_scale) {
			// Aplica o empurrão de 2 pixels para longe da parede ANTES de mudar a escala
			x += _novo_scale * 2; 
			image_xscale = _novo_scale;
		}
	}

	sprite_index=definindo_sprite(dir, spr_player_walk_side,spr_player_walk_front, spr_player_walk_back);
    // Definindo a Sprite enquanto anda

	
    // Condição para sair
	//se eu estou parado eu vou para o estado idle 
	
	if(attack)
	{
		troca_estado(estado_attack)		
	}
}
#endregion

#region // estado attack
estado_attack.inicia=function()
{
	
	//ajustando o sprite  
	sprite_index=definindo_sprite(dir, spr_player_attack_side,spr_player_attack_front, spr_player_attack_back)
	
	//garantindo que a animação começo no primeiro frame 
	image_index=0;
	
	velh=0;
	velv=0;
	
	
	
	
	//Criando o dano 
	var _x= x + lengthdir_x(16, dir*90);
	var _y= y + lengthdir_y (16, dir*90);
	
	meu_dano=instance_create_depth(_x,_y, depth, obj_dano);
	
	
}

//saindo do estado attack

estado_attack.roda=function()
{	
	//compara o número de imagens com a imagem de ataque 
	if(image_index>=image_number-0.2)
	{
		troca_estado(estado_idle);	
	}
}
estado_attack.finaliza= function()
{
	//Encerro o meu dano 
	instance_destroy(meu_dano); 
}

#endregion

#region // estado tiro
	estado_tiro.inicia=function()
	{
	//ajustando o sprite  
	sprite_index=definindo_sprite(dir, spr_player_attack_side,spr_player_attack_front, spr_player_attack_back)
	
	//garantindo que a animação começo no primeiro frame 
	image_index=0;
	
	velh=0;
	velv=0;	
	
	var _x=x+lengthdir_x(30, dir*90);
	var _y=y+lengthdir_y(28, dir*90);
	
	var _tiro=instance_create_depth(_x,_y,depth+1, obj_tiro);
			
	// Define a direção exata para onde o tiro deve ir 
	_tiro.direction = dir * 90;
	
	//definada a velocidade 
	_tiro.speed=vel_tiro;

	
	}
	
	
estado_tiro.roda=function()
{	
	//compara o número de imagens com a imagem de ataque 
	if(image_index>=image_number-0.2)
	{
		troca_estado(estado_idle);	
	}
}
	
#endregion

#region // iniciando variáveis 

//Controles sendo iniciados sem valor 

up=noone;
down=noone;
left=noone;
right=noone;
attack=noone;
tiro=noone;
//Variáveis de movimento
//iniciando parado 

velh=0;
velv=0;


//velocidade do jogador
vel=2;

//velocidade do tiro
vel_tiro=3;

//controlando a direção que o player está olhando 
dir =0;
#endregion



//inicia minha maquina de estados 
inicia_estado(estado_idle);