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


menu=[opcao1, opcao2];

//variavel para saber qual indice atual 
atual=0;


//criando margem

margem=0;