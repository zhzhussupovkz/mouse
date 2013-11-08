=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#class Cheese
class Cheese

  def initialize window, x, y
    @image = Gosu::Image.new(window, "images/cheese.png", false)
    @x, @y = x, y
    @drawing = true
  end

  attr_accessor :drawing
  attr_accessor :x, :y

  #draw cheese
  def draw
    @image.draw(@x, @y, 1) if drawing
    @x %= 640
    @y %= 480
  end

end