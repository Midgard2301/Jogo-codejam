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



menu=[opcao1, opcao2, opcao3];

//variavel para saber qual indice atual 
atual=0;

//criando margem

margem=0;