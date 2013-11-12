=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#class Mouse - main player
class Mouse < Player

  def initialize window, x, y
    super window, x, y, "images/players/mouse.png", "images/players/mouse-r.png"
    @score, @lives = 0, 3
    @heart = Gosu::Image.new(window, "images/players/heart.png", false)
    @ui = Gosu::Font.new(window, 'Monaco', 25)
    puts "Create mouse..."
    @on_ground = false
  end

  attr_reader :lives
  attr_accessor :on_ground, :score

  #draw mouse
  def draw
    super
    @ui.draw("Score: #{@score}", 10, 450, 2)
    @heart_x = 0
    @lives.times do
      @heart.draw(600 - @heart_x, 450, 2)
      @heart_x += 24
    end
  end

  #move down
  def down
    @y += 2.5 if @y <= 372.5
  end

  #dead
  def dead
    @lives -= 1
    @lives = 0 if @lives <= 0
  end

  def dead?
    return @lives == 0
  end

  #add score
  def add_score
    @score += 100
  end

  #reboot mouse
  def reboot
    @x, @y, @face_left = 520, 375, true
  end

end