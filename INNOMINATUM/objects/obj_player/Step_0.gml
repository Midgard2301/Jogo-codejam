// pegando os inputs do usuário
up		=keyboard_check(vk_up) or keyboard_check(ord("W"));
down	=keyboard_check(vk_down) or keyboard_check(ord("S")); 
left	=keyboard_check(vk_left) or keyboard_check(ord("A"));
right	=keyboard_check(vk_right) or keyboard_check(ord("D"));
attack  =keyboard_check_pressed(vk_space) or keyboard_check(ord("J"));
tiro	=keyboard_check(vk_tab)or keyboard_check(ord("L"));



if (vida > 0) {
    global.safe_player_x = x;
    global.safe_player_y = y;
}
//ajustando minha profundidade 
depth=-y;

// Rodando a minha maquina de estados 

roda_estado();

<<<<<<< Updated upstream


if (global.vida_atual <= 0) {
    //restaurar a vida 
    global.vida_atual = global.vida_maxima;
    
    //recarrear sala
    room_goto(global.sala_salva);
}
=======
>>>>>>> Stashed changes
