//Iniciar variáveis

// Define o tamanho da janela (Largura, Altura) em pixels
window_set_size(640, 360);  

// Centraliza a janela na sua tela
window_center();


//iniciando primeiro estado 
estado_idle= new estado();

//iniciando estado walk 
estado_walk=new estado();

//iniciando o estado de ataque 
estado_attack = new estado();


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
		
	dir=(point_direction(0, 0, velh, velv)div 90); 
    
	//Ajustando o lado que ele olha 
	if (velh!=0)
	{
		image_xscale=sign(velh);
	}

	sprite_index=definindo_sprite(dir, spr_player_walk_side,spr_player_walk_front, spr_player_walk_back);
    // Definindo a Sprite enquanto anda
	velv=(down-up)*vel;
		
	velh=(right-left)*vel;
	
    // Condição para sair
	//se eu estou parado eu vou para o estado idle 
    if (velh == 0 && velv == 0) {
        troca_estado(estado_idle);
    }
	
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

#endregion

#region // iniciando variáveis 

//Controles sendo iniciados sem valor 

up=noone;
down=noone;
left=noone;
right=noone;
attack=noone;
//Variáveis de movimento
//iniciando parado 

velh=0;
velv=0;


//velocidade do jogador
vel=2;

//controlando a direção que o player está olhando 
dir =0;
#endregion


//inicia minha maquina de estados 
inicia_estado(estado_idle);