=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#class Brick
class Brick

  def initialize window, x, y
    begin
      @x, @y, @window = x, y, window
      @image = Gosu::Image.new(window, "images/level/wall.png", false)
      @drawing = true
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_accessor :x, :y, :drawing
  attr_reader :window

  #draw brick
  def draw
    begin
      @image.draw(@x, @y, 1) if drawing
      @x %= 640
      @y %= 480
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

end