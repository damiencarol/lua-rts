
require("gui")
require("button")

function love.load()

	gui_load()
	button_load()

	button_first = Button.create()
	button_first.x = 200
	button_first.y = 150
	button_first.size_x = 150
	button_first.size_y = 90
	button_first.text = "Play"

   --local f = love.graphics.newFont(12)
   --love.graphics.setFont(f)
   --love.graphics.setColor(0,0,0,255)
   --love.graphics.setBackgroundColor(255,255,255)
end

function love.keypressed(key)   -- we do not need the unicode, so we can leave it out
   if key == "escape" then
      love.event.push("quit")   -- actually causes the app to quit
   end
   
   if key == "f1" then
      deb= not deb
   end

   
	if key == "left" then
		button_first.size_x = button_first.size_x - 1
	end
	if key == "right" then
		button_first.size_x = button_first.size_x + 1
	end
	if key == "f1" then
		deb= not deb
	end
	if key == "f1" then
		deb= not deb
	end
end

function love.mousepressed(x, y, button)
   if button == "l" then
		button_first.x = 50
		button_first.y = 50
		button_first.size_x = x
		button_first.size_y = y
   end
end

deb=false

function love.draw()
	local mx, my = love.mouse.getPosition()  -- current position of the mouse
    love.graphics.print("x"..mx.." y"..my, 0, 0)
	
	-- hover button ?
	button_first.hover = false
	if mx > button_first.x and mx < (button_first.x + button_first.size_x) then
		if my > button_first.y and my < (button_first.y + button_first.size_y) then
			button_first.hover = true
		end
	end
	
	
	button_first:draw(0, 0)
	
	if not deb then
		return
	end
	
	--love.graphics.setColor( 255, 255, 255, 255 )
	love.graphics.line(button_first.x, button_first.y,
		button_first.x + button_first.size_x, button_first.y)
	love.graphics.line(button_first.x + button_first.size_x, button_first.y,
		button_first.x + button_first.size_x, button_first.y + button_first.size_y)
	love.graphics.line(button_first.x + button_first.size_x, button_first.y + button_first.size_y,
		button_first.x, button_first.y + button_first.size_y)
	love.graphics.line(button_first.x, button_first.y + button_first.size_y,
		button_first.x, button_first.y)
	
	
	love.graphics.setColor( 255, 0, 0, 255 )
	love.graphics.line(button_first.x, button_first.y - 25, button_first.x, button_first.y + 25)
	love.graphics.line(button_first.x - 25, button_first.y, button_first.x + 25, button_first.y)
	love.graphics.setColor( 255, 255, 255, 255 )

end