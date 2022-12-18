draw_self();
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_color(c_black);

if(obj_game.input_focused_id == self.id){
	draw_text(self.x,self.y + 3,self.input_value + self.cursor);
}else{
	draw_text(self.x,self.y + 3,self.input_value);
}

