
Panel = {}
Panel.__index = Panel

function panel_load()
	--Panel.font = love.graphics.newFont("fnt/Kelt Caps Freehand.ttf", 64)
end

function Panel.create()
	local lab = {}
	setmetatable(lab, Panel)

	lab.x = 0
	lab.y = 0
	lab.size_x = 50
	lab.size_y = 50

	lab.style = 1
	lab.style_img = gui.image_background

	return lab
end

function Panel:setWidth(val) self.size_x = val end
function Panel:setHeight(val) self.size_y = val end

function Panel:setStyle(val)
	self.style = val
	if val == 1 then
		self.style_img = gui.image_background
	else
		self.style = 0
		self.style_img = gui.image_background_wood
	end
end

function Panel:draw(offset_x, offset_y)

	local nb_x = self.size_x / self.style_img:getWidth()
	local nb_x_rd = self.size_x % self.style_img:getWidth()
	local nb_y = self.size_y / self.style_img:getHeight()
	local nb_y_rd = self.size_y % self.style_img:getHeight()

	for i=0,nb_x do
		for j=0, nb_y do
			love.graphics.draw(self.style_img, offset_x + self.x + i*self.style_img:getWidth(),
				offset_y + self.y + j*self.style_img:getHeight())
		end
	end
end