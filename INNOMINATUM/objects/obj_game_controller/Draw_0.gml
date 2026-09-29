if(global.game_over)
{
	//pegando algumas informações 
	var x1=camera_get_view_x(view_camera[0]);
	var w=camera_get_view_width(view_camera[0]);
	var x2=x1+w;
	var meio_w= x1+w/2;
	var y1=camera_get_view_y(view_camera[0]);
	var h= camera_get_view_height(view_camera[0]);
	var y2=y1+h;
	var meio_h= y1+h/2;
	
	
	var qtd=h*.15;
	
	valor=lerp(valor, 1, .01);
	
	draw_set_colour(c_black);
	
	//escurecendo a tela 
	draw_set_alpha(valor -.3);
	draw_rectangle(x1, y1, x2, y2, false);

	
	
	draw_set_alpha(1);
	draw_set_colour(-1);
	
	if(valor>=.85)
	{
		contador=lerp(contador, 1, .01);
		//escrevenso game over 
		draw_set_alpha(contador);
		draw_set_font(fnt_menu);
		draw_set_valign(1);
		draw_set_halign(1);
		draw_text(meio_w, meio_h, "Game-over");
		draw_set_font(-1);
		
		draw_text(meio_w, meio_h+50, "Pressione enter para restart");
		
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);

		draw_set_alpha(1);
		draw_set_color(c_white);
	}
} 