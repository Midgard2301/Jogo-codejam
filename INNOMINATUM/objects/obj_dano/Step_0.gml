var _lista=	ds_list_create();


var _qtd=	instance_place_list(x, y, obj_inimigo_pai, _lista, false);

//pegar os inimigos da minha lista e passar para outra  

for (var i=0; i< ds_list_size(_lista); i++)
{
	//pegando o inimigo atual da lista 
	var _atual=_lista[| i];
	
	//checando o inimigo atual não existe na minha lista de inimigos
	var _existe=array_contains(lista_inimigos, _atual);
	
	//se o inimigo não existe na lista de inimigos
	if(!_existe){
		array_push(lista_inimigos, _atual);
		//eu vou dar dano 
		with(_atual)
		{
			troca_estado(estado_hurt);
		}
	}	
}

//depois que eu usei a lista, eu zero ela 

ds_list_destroy(_lista);