// pegando os inputs do usuário
up		=keyboard_check(vk_up);
down	=keyboard_check(vk_down); 
left	=keyboard_check(vk_left);
right	=keyboard_check(vk_right);
attack = keyboard_check_pressed(vk_space);

//ajustando minha profundidade 
depth=-y;

// Rodando a minha maquina de estados 

roda_estado();