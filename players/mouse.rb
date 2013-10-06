#class Mouse - main player
class Mouse < Player

  def initialize window, x, y
    super window, x, y, "images/mouse.png", "images/mouse-r.png"
    @score = 0
    @ui = Gosu::Font.new(window, 'Monaco', 25)
  end

  def draw
    super
    @ui.draw("Score: #{@score}", 10, 450, 2)
  end

end