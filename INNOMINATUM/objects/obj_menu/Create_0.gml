//Menu

// criando as estruturas do menu

opcao1	=
{
	texto: "Jogar",
	funcao: function(){
		room_goto(rm_jogo);
	},
}

opcao2	=
{
	texto: "Sair",
	funcao: function(){
		game_end();
	}
}

opcao3	=
{
	texto: "Boss",
	funcao: function(){
		room_goto(boss_room);
	}
}

opcao4 =
{
	texto: "segundo boss",
	funcao: function(){
		room_goto(boss2_room);	
	}
}

opcao5 =
{
	texto: "Terceiro boss",
	funcao: function(){
		room_goto(boss3_room);
	}
}

menu=[opcao1, opcao2, opcao3, opcao4, opcao5];

//variavel para saber qual indice atual 
atual=0;

//criando margem

margem=0;