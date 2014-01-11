=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#class Player
class Player

  def initialize window, x, y, left, right
    @window, @x, @y = window, x, y
    @left = Gosu::Image.new(window, left, false)
    @right = Gosu::Image.new(window, right, false)
    @face_left = true
  end

  attr_reader :window
  attr_accessor :x, :y

  def feet_on? brick
    feet_x = @x + 20.0
    feet_y = @y + 36.0
    feet_x >= brick.x      &&
    feet_x <= brick.x + 36 &&
    feet_y >  brick.y      &&
    feet_y <  brick.y + 48
  end

  def feet_y= val
    dy = 2.0
    @y = val - dy
  end

  #move left
  def move_left
    if not window.level.pause
      @face_left = true
      @x -= 5.0
    end
  end
  
  #move right
  def move_right
    if not window.level.pause
      @face_left = false
      @x += 5.0 if @x <= 595.0
    end
  end
  
  #up
  def up
    @y -= 20.0 if @y >= 17.0 && (not window.level.pause)
  end

  #move down
  def down
    @y += 7.0 if @y <= 372.5 && (not window.level.pause)
  end
  
  #move
  def move
    @x %= 640
    @y %= 480
  end

  #draw
  def draw
    if @face_left
      @left.draw(@x, @y, 1)
    else
      @right.draw(@x, @y, 1)
    end
  end

end