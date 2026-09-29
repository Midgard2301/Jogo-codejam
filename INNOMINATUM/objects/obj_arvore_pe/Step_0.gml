//profundidade 
depth=-bbox_bottom;

//ficando transparente quando passar por trás da arvore 
if (instance_exists(obj_player))
{
//Checando se o player está mais alto do que eu

	if(obj_player.y<y)
	{
		//Checando se o player esta mais ou menos atras de mim 
		if(point_in_rectangle(obj_player.x, obj_player.y, bbox_left-10,bbox_top-25, bbox_right+10, bbox_top))
		{
		//Ficando Transparente 
		image_alpha=lerp(image_alpha, .5, .05);
		}	 
		else 
		{
			image_alpha=lerp(image_alpha, 1, .1);
		}
		

	}
}