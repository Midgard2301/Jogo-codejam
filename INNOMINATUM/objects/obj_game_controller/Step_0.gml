//Definisfo a morte 
var _room_id = asset_get_index(global.room_nome);

	if(instance_exists(obj_game_controller))
	{
		if(!instance_exists(obj_player))
		{
			if(global.game_over==true)
			{
				if(keyboard_check_pressed(vk_enter))
				{
					global.reiniciando_morte = true;
					room_goto(_room_id);
					global.game_over=false;
				}

			}
		}
	}


/*Caso pressionar enter 
if(keyboard_check(vk_enter))
{
	game_over=true;
}
else
{
	game_over=false;
}


*/