

//Mudando de opção 

//descendo
if (keyboard_check_pressed(vk_down))
{
	atual++;
	margem=0;
}

if (keyboard_check_pressed(vk_up)) 
{
	atual--;
	//zerando a margem 
	margem=0;
}


//limitando a variável atual 

atual =clamp(atual, 0, array_length(menu)-1);

//fazendo o valor da margem aumentar
margem =lerp(margem, 20, .2);


//Ao selecionar clicar enter, executa a função 
if(keyboard_check_pressed(vk_enter))
{
	menu[atual].funcao(); 
}

