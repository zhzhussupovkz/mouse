=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#class Brick
class Brick

  def initialize window, x, y
    @x, @y, @window = x, y, window
    @image = Gosu::Image.new(window, "images/level/wall.png", false)
    @drawing = true
  end

  attr_accessor :x, :y, :drawing
  attr_reader :window

  #draw brick
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