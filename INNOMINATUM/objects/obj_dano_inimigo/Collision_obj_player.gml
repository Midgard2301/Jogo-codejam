var vida_player=obj_player.vida;

instance_destroy();

if(vida_player>0)
{
	with(other)
	{
		troca_estado(estado_hurt);
	}
}