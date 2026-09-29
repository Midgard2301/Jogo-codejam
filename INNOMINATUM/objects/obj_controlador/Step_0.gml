// alterna entre tela cheia e janela
if (keyboard_check_pressed(vk_f11)) {
    var _estado_atual = window_get_fullscreen();
    window_set_fullscreen(!_estado_atual);
}