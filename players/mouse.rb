#class Mouse - main player
class Mouse < Player

  def initialize window, x, y
    super window, x, y, "images/mouse.png", "images/mouse-r.png"
    @score, @lives = 0, 3
    @heart = Gosu::Image.new(window, "images/heart.png", false)
    @ui = Gosu::Font.new(window, 'Monaco', 25)
  end

  attr_reader :score, :lives

  def draw
    super
    @ui.draw("Score: #{@score}", 10, 450, 2)
    @heart_x = 0
    @lives.times do
      @heart.draw(600-@heart_x, 450, 2)
      @heart_x += 24
    end
  end

  def dead
    @lives -= 1
    @lives = 0 if @lives <= 0
  end

  def dead?
    return @lives == 0
  end

  def add_score
    @score += 100
  end

end