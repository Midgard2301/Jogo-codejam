//salvar a sala  
function save_room()
{
	global.room_nome=room_get_name(room);
	//salva o número de inimigos 
	var _inimigos=instance_number(obj_inimigo_pai);

	if (!variable_global_exists("safe_player_x")) {
		global.safe_player_x = instance_exists(obj_player) ? obj_player.x : 100;
	}
	if (!variable_global_exists("safe_player_y")) {
		global.safe_player_y = instance_exists(obj_player) ? obj_player.y : 100;
	}

	if (instance_exists(obj_player)) {
		global.safe_player_x = obj_player.x;
		global.safe_player_y = obj_player.y;
	}
	
	//Struct é como um obj que pode receber variáveis e arrays 
	var _roomStruct=
	{
		inimigos: _inimigos,
		inimigoData: array_create(_inimigos),	
					
		player_x: global.safe_player_x,
		player_y: global.safe_player_y,
		player_vida: 2
	}
	
	//passando por cada inimigo 
	for(i=0; i<_inimigos; i++)
	{
		var _inst =instance_find(obj_inimigo_pai, i);
		
		_roomStruct.inimigoData[i]=
		{
			// pegando os valores x e y de cada inimigo e mandando para o array 
			x: _inst.x,
			y: _inst.y,
			vida: _inst.vida
		}
	}
	
	
	//escohedo qual a sala que o player se apresenta 
	if room == rm_jogo {global.levelData.level_1=_roomStruct;};
	if room == rm_boss {global.levelData.level_2=_roomStruct;};
	if room == rm_boss2 {global.levelData.level_3=_roomStruct;};
	
}

//carregando a room 

function load_room() 
{
	global.room_nome = room_get_name(room);
	var _roomStruct = 0;	
	
	// Pegando os valores salvos
	if room == rm_jogo { _roomStruct = global.levelData.level_1; };
	if room == rm_boss { _roomStruct = global.levelData.level_2; };
	if room == rm_boss2 { _roomStruct = global.levelData.level_3; };
	
	// Saindo se roomStruct não existir
	if !is_struct(_roomStruct) { exit; };
	
	if (instance_exists(obj_inimigo_pai)) { 
		instance_destroy(obj_inimigo_pai); 
	}
	
	for (i = 0; i < _roomStruct.inimigos; i++)
	{
		var _novo_inimigo = noone;
		
		if room == rm_jogo {
			_novo_inimigo = instance_create_depth(_roomStruct.inimigoData[i].x, _roomStruct.inimigoData[i].y, depth, obj_inimigo_slime);
		}
		if room == rm_boss {
			_novo_inimigo = instance_create_depth(_roomStruct.inimigoData[i].x, _roomStruct.inimigoData[i].y, depth, obj_boss);
		}
		if room == rm_boss2 {
			_novo_inimigo = instance_create_depth(_roomStruct.inimigoData[i].x, _roomStruct.inimigoData[i].y, depth, obj_boss2);
		}
	 
		if (_novo_inimigo != noone) {
			_novo_inimigo.vida = _roomStruct.inimigoData[i].vida;
		} 
	}	
	
	
	if (variable_global_exists("reiniciando_morte") && global.reiniciando_morte)
	{
		if (instance_exists(obj_player)) {
			var _p = instance_find(obj_player, 0);
			_p.x = _roomStruct.player_x;
			_p.y = _roomStruct.player_y;
			_p.vida = _roomStruct.player_vida;
			
			
			while (instance_number(obj_player) > 1) {
				var _extra_player = instance_find(obj_player, 1);
				instance_destroy(_extra_player);
			}
		} 
		else {
			instance_create_depth(_roomStruct.player_x, _roomStruct.player_y, depth, obj_player);
		}
		
		// Desliga a chave de morte
		global.reiniciando_morte = false;
	}
	else 
	{
		if (variable_global_exists("target_x") && variable_global_exists("target_y")) {
			if (instance_exists(obj_player)) {
				obj_player.x = global.target_x;
				obj_player.y = global.target_y;
			}
		}
	}
}
