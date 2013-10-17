#class Level
class Level

  def initialize window, num
    @window, @num = window, num
    @cheeses = []
    @bricks = []
    @ui = Gosu::Font.new(@window, 'Monaco', 25)
  end

  attr_reader :cheeses, :ui

  def start
    @num*3.times do
      @x_cord = rand(10..550)
      @y_cord = rand(50..325)
      @cheeses << Cheese.new(@window, @x_cord, @y_cord)
      @bricks << Brick.new(@window, @x_cord, @y_cord + 36)
    end
  end

  def draw
    @bricks.each do |e| e.draw end
    @cheeses.each do |e| e.draw end
    @ui.draw("Level:#{@num}", 10, 425, 2)
  end

end