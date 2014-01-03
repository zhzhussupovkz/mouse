=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#class Cheese
class Cheese

  def initialize window, x, y
    @x, @y, @window = x, y, window
    @image = Gosu::Image.new(window, "images/level/cheese.png", false)
    @drawing = true
  end

  attr_accessor :x, :y, :window, :drawing

  #draw cheese
  def draw
    @image.draw(@x, @y, 1) if drawing
    @x %= 640
    @y %= 480
  end

  #move
  def move
    if @drawing
      @x += 2.0 if window.button_down? Gosu::KbLeft
      @x -= 2.0 if window.button_down? Gosu::KbRight
    end
  end

end