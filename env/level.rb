#class Level
class Level

  def initialize window, num
    @window, @num = window, num
    @cheesees = []
    @ui = Gosu::Font.new(@window, 'Monaco', 25)
  end

  def start
    @num*5.times do
      @cheesees << Cheese.new(@window, rand(10..550), rand(50..325))
    end
  end

  def draw
    @cheesees.each { |e| e.draw }
    @ui.draw("Level:#{@num}", 10, 425, 2)
  end

end