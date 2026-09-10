var _inimigo = instance_place(x, y, obj_inimigo_pai);

if(_inimigo!=noone){
	with(_inimigo){
	 troca_estado(estado_hurt);
	}	

	 instance_destroy();
}	