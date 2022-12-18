draw_self();
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_set_color(c_black);

var leftX = self.x - (sprite_width / 2) + 5;
var leftY = self.y;

draw_text(leftX,leftY,self.game_name);

draw_set_halign(fa_center);
draw_text(self.x,self.y, self.creator_name);


draw_set_halign(fa_right);

var right_x = self.x + (sprite_width / 2) - 5;
draw_text(right_x,self.y,string(self.number_of_gamers));


