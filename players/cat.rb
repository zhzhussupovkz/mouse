=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#class Cat
class Cat < Player

  def initialize window, x, y
    begin
      super window, x, y, "images/players/cat.png", "images/players/cat-r.png"
      @face_left, @time = false, Time.now.to_i
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
    puts "Create cat..."
  end

  attr_writer :x, :y

  #move left
  def move_left
    super
    @x = 5.0 if @x <= 5.0
  end

  #some artificial intelligence for cat
  def ai
    mx = window.level.mouse.x
    my = window.level.mouse.y
    if @x + 35.0 < mx
      move_right
      if @y >= my + 15.0
        up
      end
    elsif @x > mx + 35.0
      move_left
      if @y >= my + 15.0
        up
      end
    end
  end

  #update
  def update
    ai
    down
  end

end