pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()

	-- ball
	ball_x = 20
	ball_dx = 2
	ball_y = 64
	ball_dy = -2
	ball_radius = 2
	
	-- paddle
	pad_x = 30
	pad_y = 120
	pad_w = 30
	pad_h = 4
	pad_speed = 2
		
	cls()

end

function _update()
	
	ball_x = ball_x + ball_dx
	ball_y = ball_y + ball_dy
	
	move_paddle()
	check_bounce()
	
end

function check_bounce()

	-- x-achse
	if ball_x+ball_radius+1 > 127 or ball_x-ball_radius-1 < 0 then
		ball_dx = -ball_dx
	end

	-- y-achse
	if ball_y+ball_radius+1 > 127 or ball_y-ball_radius-1 < 0 then
		ball_dy = -ball_dy
	end

end

function move_paddle()

	-- wenn links gedrueckt ist
	if btn(0) then
		pad_x = pad_x - pad_speed
	end

	-- wenn rechts gedrueckt ist
	if btn(1) then
		pad_x = pad_x + pad_speed
	end
	
	-- ist pad am linken rand?
	if pad_x < 0 then
		pad_x = 0
	end
	
	-- ist pad am rechten rand?
	if pad_x + pad_w > 127 then
		pad_x = 127 - pad_w
	end

end

function _draw()

	cls()
	circfill(ball_x,ball_y,ball_radius,10)
	rectfill(pad_x,pad_y,pad_x+pad_w,pad_y+pad_h,7)

end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
