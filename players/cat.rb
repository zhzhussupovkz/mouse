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
      @beep = Gosu::Sample.new(window, "sounds/kitten.ogg")
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
    puts "Create cat..."
  end

  attr_writer :x, :y

  #cat say meow
  def meow
    begin
      @beep.play
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  #move left
  def move_left
    super
    @x = 5.0 if @x <= 5.0
  end

  #some artificial intelligence for cat
  def ai
    time = rand(@time + 1..@time + 5)
    if time == Time.now.to_i
      where = ['left', 'right', 'up'].sample
      case where
      when 'left'
        move_left
      when 'right'
        move_right
      when 'up'
        up
      end
    end
    @time = Time.now.to_i if Time.now.to_i == time + 1
  end

  #update
  def update
    ai
    down
  end

end