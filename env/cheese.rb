=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#class Cheese
class Cheese

  def initialize window, x, y
    begin
      @x, @y, @window = x, y, window
      @image = Gosu::Image.new(window, "images/level/cheese.png", false)
      @drawing = true
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_accessor :x, :y, :window, :drawing

  #draw cheese
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