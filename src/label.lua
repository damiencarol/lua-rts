
Label = {}
Label.__index = Label

function label_load()
	Label.font = love.graphics.newFont("fnt/Kelt Caps Freehand.ttf", 64)
end

function Label.create()
	local lab = {}
	setmetatable(lab, Label)

	lab.x = 0
	lab.y = 0
	lab.text = "[DEFAULT]"
	lab.hover = false

	return lab
end

function Label:draw(offset_x, offset_y)

	-- text
	love.graphics.setFont(Label.font)
	
	local texty_x = self.x
	local texty_y = self.y + Label.font:getHeight(self.text)

	love.graphics.setColor( 0, 0, 0, 255 )
	love.graphics.print(self.text, offset_x + texty_x + 2, offset_y + texty_y + 2)

	love.graphics.setColor(192, 192, 192, 255 )
	if self.hover then
		love.graphics.setColor(255, 255, 255, 255 )
	end
	love.graphics.print(self.text, offset_x + texty_x, offset_y + texty_y)
	love.graphics.setColor( 255, 255, 255, 255 )

end