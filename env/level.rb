=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#class Level
class Level

  def initialize window
    @window, @num = window, 0
    @mouse = Mouse.new(@window, 520, 375)
    @cheeses = []
    @bricks = []
    @ui = Gosu::Font.new(@window, 'Monaco', 25)
    @c = Gosu::Font.new(@window, 'Monaco', 15)
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
    @mouse.draw
    @ui.draw("Level:#{@num}", 10, 425, 2)
    @ui.draw("Level #{@num} complete!", 250, 425, 2) if @mouse.score == total_scores
    @c.draw("Copyright (c) 2013 by zhzhussupovkz", 225, 465, 2)
  end

  #update
  def update
    if @mouse.score == total_scores
      end_level
      start
    end
    @mouse.move_left if @window.button_down? Gosu::KbLeft
    @mouse.move_right if @window.button_down? Gosu::KbRight
    @mouse.up if @window.button_down? Gosu::KbUp or @window.button_down? Gosu::KbSpace
    @mouse.down if @mouse.on_ground == false
    @mouse.move
    @cheeses.each do |e|
      if (e.x - @mouse.x).abs <= 15.0 && (e.y - @mouse.y).abs <= 15.0
        e.drawing = false
        e.x = e.y = -1
        @mouse.add_score
      end
    end
    @bricks.each do |e|
      move_player_on_top e if @mouse.feet_on? e
    end
  end

  #move player on top of brick
  def move_player_on_top brick
    @mouse.feet_y = brick.y - 36
  end

  #max scores in level
  def total_scores
    (2*@num + 0.5 * @num * (@num+1))*100
  end

  #end level
  def end_level
    @cheeses = []
    @bricks = []
    @mouse.reboot
    sleep(3)
  end

end