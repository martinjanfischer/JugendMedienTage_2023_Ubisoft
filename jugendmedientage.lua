ball_x=16
ball_y=32
ball_r=2
ball_c=10
ball_dx=1
ball_dy=1

bar_x=64
bar_y=120
bar_w=16
bar_h=4
bar_c=6
bar_dx=2

function _init()
	cls()
end

function _update()
	if btn(⬅️) then
		bar_x-=bar_dx
	end
	if btn(➡️) then
		bar_x+=bar_dx
	end
	
	ball_x+=ball_dx
	ball_y+=ball_dy
	
	if ball_x > 127 or ball_x < 0 then
		ball_dx=-ball_dx
		sfx(0)
	end
	if ball_y > 127 or ball_y < 0 then
		ball_dy=-ball_dy
		sfx(0)
	end
	
end

function _draw()
	rectfill(0,0,127,127,1)
	circfill(ball_x,ball_y,ball_r,ball_c)
	rectfill(bar_x,bar_y,bar_x+bar_w,bar_y+bar_h,bar_c)
end
