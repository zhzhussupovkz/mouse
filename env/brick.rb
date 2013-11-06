#class Brick
class Brick

  def initialize window, x, y
    @image = Gosu::Image.new(window, "images/wall.png", false)
    @x, @y = x, y
    @drawing = true
  end

  attr_accessor :x, :y, :drawing
  attr_reader :width, :height

  #draw brick
  def draw
    @image.draw(@x, @y, 1) if drawing
    @x %= 640
    @y %= 480
  end

end