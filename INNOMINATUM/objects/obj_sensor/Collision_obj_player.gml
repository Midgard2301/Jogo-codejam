//indo para procima room 

room_goto(destino);

//definindo a posição x e y do player 

other.x=posicao_x;
other.y=posicao_y;

// salva os dados no nosso sistema global
global.sala_salva = sala_alvo;
global.checkpoint_x = alvo_x;
global.checkpoint_y = alvo_y;


// vai para a nova room
room_goto(sala_alvo);