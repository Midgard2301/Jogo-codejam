//desenhando os itens do menu
for (var i =0; i<array_length(menu);i++){
	
	var _cor=c_white;

	
	//definindo minha fonte 
	draw_set_font(fnt_menu);
	
	//pegando a altura do meu texto
	var _altura=string_height("I");
	

	var _margem=0;
	
	//checando se a opção atual esta selecionada 
	
	if(i==atual){
		_cor=c_red;
		_margem=margem
	}
	
	draw_set_colour(_cor);
	draw_text(20+_margem,20+_altura*i,menu[i].texto);
	draw_set_colour(-1);
	draw_set_font(-1);
}