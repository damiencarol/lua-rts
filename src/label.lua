
Label = {}
Label.__index = Label

function label_load()

	-- Style 1 (Title big)
	Label.font = love.graphics.newFont("fnt/Kelt Caps Freehand.ttf", 64)
	
	-- Style 3 (Litte text) (default)
	Label.font_3 = love.graphics.newFont("fnt/Benegraphic.ttf", 36)
end

function Label.create()
	local lab = {}
	setmetatable(lab, Label)

	lab.x = 0
	lab.y = 0
	lab.text = "[DEFAULT]"
	lab.hover = false
	lab.style = 3
	lab.style_fnt = Label.font_3

	return lab
end

function Label:setStyle(val)
	self.style = val
	if val == 1 then
		self.style_fnt = Label.font
	elseif val == 3 then
		self.style_fnt = Label.font_3
	else
		self.style = 0
		self.style_fnt = Label.font_3
	end
end

function Label:draw(offset_x, offset_y)

	-- set the font
	love.graphics.setFont(self.style_fnt)

	love.graphics.setColor(192, 192, 192, 255 )
	if self.hover then
		love.graphics.setColor(255, 255, 255, 255 )
	end
	love.graphics.print(self.text, offset_x + self.x, offset_y + self.y)
	love.graphics.setColor( 255, 255, 255, 255 )

end