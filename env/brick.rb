#class Brick
class Brick

  def initialize window, x, y
    @image = Gosu::Image.new(window, "images/brick.png", false)
    @x, @y = x, y
  end

  #draw brick
  def draw
    @image.draw(@x, @y, 1)
  end

end