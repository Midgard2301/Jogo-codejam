// iniciando maquina de estados 

function estado() constructor{
//iniciando estado 
static inicia= function(){};

//rodando estado
static roda= function(){};

//finalizando estado
static finaliza=function(){};

}

//funções para controlar máquina de estados 


// iniciando estado 

function inicia_estado(_estado){
	
	//salva o estado passado em uma variável
	estado_atual=_estado;
	
	//Iniciando estado atual 
	estado_atual.inicia();	


}


//rodando estado 

function roda_estado(){
	estado_atual.roda();
}


// trocando de estado

function troca_estado(_estado){
	//finaliza o estado atual 
	estado_atual.finaliza();
	
	// rodando o estado atual 
	estado_atual= _estado;
	//iniciando novo estado
	
	estado_atual.inicia();
}


function definindo_sprite(_dir=0, sprite_side,sprite_front,sprite_back)
{
var _sprite;
	switch(_dir){
	case 0:_sprite=sprite_side; break;
	case 1:_sprite=sprite_back; break;
	case 2:_sprite=sprite_side; break;
	case 3:_sprite=sprite_front; break;
	}
	return _sprite;
	
}


