=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#class Mouse - main player
class Mouse < Player

  def initialize window, x, y
    begin
      super window, x, y, "images/players/mouse.png", "images/players/mouse-r.png"
      @score, @lives = 0, 3
      @heart = Gosu::Image.new(window, "images/players/heart.png", false)
      @ui = Gosu::Font.new(window, 'Monaco', 25)
      puts "Create mouse..."
      @on_ground = @injured = false
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :lives
  attr_accessor :on_ground, :score, :injured

  #draw mouse
  def draw
    begin
      super
      @ui.draw("Score: #{@score}", 10, 450, 2)
      @heart_x = 0
      @lives.times do
        @heart.draw(600 - @heart_x, 450, 2)
        @heart_x += 24
      end
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  #dead
  def dead
    @injured = true
    @lives -= 1 if @injured
    @injured = false
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
    @x, @y, @face_left, @injured = 520, 385, true, false
  end

  #game over
  def game_over
    window.level.game_over = true if dead?
  end

end