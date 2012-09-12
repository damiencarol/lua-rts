

Button = {}
Button.__index = Button

--button_quad = {}

function button_load()
	--button_tilesetBatch = love.graphics.newSpriteBatch(gui.image_gui, 20 * 50)
	--button_quad = love.graphics.newQuad(500, 500, 300, 80, gui.image_gui:getWidth(), gui.image_gui:getHeight())

	Button.font = love.graphics.newFont("fnt/Knight2.ttf", 32)
end

function Button.create()
	local but = {}
	setmetatable(but, Button)
	
	but.x = 0
	but.y = 0
	but.size_x = 300
	but.size_y = 80
	but.text = "[DEFAULT]"
	but.hover = false
	
	return but
end


function Button:draw(offset_x, offset_y)
	local button_quad
	button_quad = love.graphics.newQuad(864, 396, 30, 30, 
		gui.image_gui:getWidth(), gui.image_gui:getHeight())

	border_left_quad = love.graphics.newQuad(864, 428, 30, 50, 
		gui.image_gui:getWidth(), gui.image_gui:getHeight())

	border_right_quad = love.graphics.newQuad(864, 428, 30, 50, 
		gui.image_gui:getWidth(), gui.image_gui:getHeight())

		
		
	back_quad = love.graphics.newQuad(0, 0, self.size_x, self.size_y, 
		gui.image_gui:getWidth(), gui.image_gui:getHeight())

	-- hover effect
		if not self.hover then
		love.graphics.setColor(192, 192, 192, 255 )
	else
		love.graphics.setColor(255, 255, 255, 255 )
	end

	-- background
	love.graphics.drawq(gui.image_background_wood, back_quad, offset_x + self.x, offset_y + self.y)

	-- left border
	do
		local nb = self.size_y / 50
		local nb_rd = self.size_y % 50
		for i=0,(nb-1) do
			love.graphics.drawq(gui.image_gui, border_left_quad, offset_x + self.x - 6, offset_y + self.y + (50 * i))
		end
		local rd_left_quad = love.graphics.newQuad(864, 428, 30, nb_rd,
			gui.image_gui:getWidth(), gui.image_gui:getHeight())
		love.graphics.drawq(gui.image_gui, border_left_quad, offset_x + self.x - 6, offset_y + self.y + (50 * (nb-1)))
		
		-- upper left corner
		love.graphics.drawq(gui.image_gui, button_quad, offset_x + self.x - 6, offset_y + self.y - 6)
	end


	-- text
	love.graphics.setFont(Button.font)
	
	local texty_x = self.x + (self.size_x/2) - (Button.font:getWidth(self.text)/2)
	local texty_y = self.y + (self.size_y/2) - (Button.font:getHeight(self.text)/2)

	love.graphics.setColor( 0, 0, 0, 255 )
	love.graphics.print(self.text, offset_x + texty_x + 2, offset_y + texty_y + 2)

	love.graphics.setColor(192, 192, 192, 255 )
	if self.hover then
		love.graphics.setColor(255, 255, 255, 255 )
	end
	love.graphics.print(self.text, offset_x + texty_x, offset_y + texty_y)
	love.graphics.setColor( 255, 255, 255, 255 )

end



