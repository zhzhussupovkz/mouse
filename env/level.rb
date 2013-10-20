#class Level
class Level

  def initialize window
    @window, @num = window, 0
    @cheeses = []
    @bricks = []
    @ui = Gosu::Font.new(@window, 'Monaco', 25)
    puts "Initialize levels..."
  end

  attr_reader :ui, :num
  attr_accessor :bricks, :cheeses

  #starting level
  def start
    @num += 1
    (2+@num).times do
      @x_cord = rand(10..550)
      @y_cord = rand(50..325)
      @cheeses << Cheese.new(@window, @x_cord, @y_cord)
      @bricks << Brick.new(@window, @x_cord - 10, @y_cord + 36)
    end
    puts "Starting level #{@num}."
    puts "Go!"
  end

  #draw
  def draw
    @cheeses.each do |e| e.draw end
    @bricks.each do |e| e.draw end
    @ui.draw("Level:#{@num}", 10, 425, 2)
  end

  #max scores in level
  def total_scores
    (2*@num + 0.5 * @num * (@num+1))*100
  end

  #end level
  def end_level
    @cheeses = []
    @bricks = []
  end

end