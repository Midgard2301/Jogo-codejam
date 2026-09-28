draw_set_font(fnt_dialogo);

//Desenhando a caixa de diálogo
var _larg = display_get_gui_width();
var _alt = display_get_gui_height();

var _marg = 5;
var _padd = 5;

var _caixa_larg = _larg;
var _caixa_alt = 200;

var _x1 = _marg;
var _x2 = _caixa_larg - _marg * 2;

var _y1 = _alt - _marg - _caixa_alt;
var _y2 = _y1 + _caixa_alt;

draw_sprite_stretched(spr_dialogo, 0, _x1, _y1, _x2, _caixa_alt);

var _txt_x = _x1 + _padd;
var _txt_y = _y1 + _padd;

//Desenhando o texto
draw_text_ext(_txt_x, _txt_y, texto, 20, _caixa_larg);

//desenhando o espaço do retrato
var _escala = 4;

var _larg_retrato = 38 * _escala;
var _alt_retrato = 38 * _escala;

var _ret_x = _larg - (_marg * 2) - _larg_retrato;
var _ret_y = _y1 - (_marg * 2) - _alt_retrato;

draw_sprite_stretched(spr_dialogo, 0, _ret_x - _marg, _ret_y - _marg, _larg_retrato + _marg * 2, _alt_retrato + _marg * 2);

//Desenhando o retrato por cima
draw_sprite_stretched(foto, 0, _ret_x, _ret_y, _larg_retrato, _alt_retrato);

draw_set_font(-1);
