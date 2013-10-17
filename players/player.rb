#class Player
class Player

  def initialize window, x, y, left, right
    @x, @y = x, y
    @left = Gosu::Image.new(window, left, false)
    @right = Gosu::Image.new(window, right, false)
    @face_left = true
  end

  attr_reader :x, :y

  #move left
  def move_left
    @face_left = true
    @x -= 5.0
    @x = 1.0 if @x <= 1.0
  end
  
  #move right
  def move_right
    @face_left = false
    @x += 5.0 if @x <= 595.0
  end
  
  #up
  def up
    @y -= 7.0 if @y >= 17.0
  end

  #move down
  def down
    @y += 2.5 if @y <= 372.5
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