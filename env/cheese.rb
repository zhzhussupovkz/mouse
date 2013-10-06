#class Cheese
class Cheese

  def initialize window, x, y
    @image = Gosu::Image.new(window, "images/cheese.png", false)
    @x, @y = x, y
  end

  #draw cheese
  def draw
    @image.draw(@x, @y, 1)
  end

end