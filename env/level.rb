=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#class Level
class Level

  def initialize window
    begin
      @window, @num = window, 0
      @mouse = Mouse.new(@window, 520, 385)
      @cat = Cat.new(@window, 5, 385)
      @cheeses = []
      @bricks = []
      @pause = @game_over = false
      @ui = Gosu::Font.new(@window, 'Monaco', 25)
      @c = Gosu::Font.new(@window, 'Monaco', 15)
      puts "Initialize levels..."
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :ui, :mouse, :window
  attr_accessor :bricks, :cheeses, :num, :pause, :game_over

  #starting level
  def start
    @num += 1
    begin
      (50..550).step(150) do |i|
        y_cord = rand(50..325)
        @cheeses << Cheese.new(@window, i, y_cord)
        @bricks << Brick.new(@window, i - 10, y_cord + 36)
      end
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
    puts "Starting level #{@num}."
    puts "Go!"
  end

  #draw
  def draw
    begin
      @cheeses.each do |e| e.draw end
      @bricks.each do |e| e.draw end
      @mouse.draw
      @cat.draw
      @ui.draw("Level:#{@num}", 10, 425, 2)
      @ui.draw("Level #{@num} complete!", 250, 425, 2) if @mouse.score == total_scores
      year = (Time.at(Time.now.to_i)).strftime("%Y")
      @c.draw("Copyright (c) #{year} by zhzhussupovkz", 225, 465, 2)
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  #update
  def update
    begin
      if @mouse.score == total_scores
        end_level
        start
      end
      @cat.update
      @mouse.move_left if @window.button_down? Gosu::KbLeft
      @mouse.move_right if @window.button_down? Gosu::KbRight
      @mouse.up if @window.button_down? Gosu::KbUp or @window.button_down? Gosu::KbSpace
      @mouse.down if @mouse.on_ground == false
      @mouse.move
      @cheeses.each do |e|
        if (e.x - @mouse.x).abs <= 15.0 && (e.y - @mouse.y).abs <= 15.0 && e.drawing
          e.drawing = false
          @mouse.add_score
        end
      end
      @bricks.each do |e|
        move_player_on_top @mouse, e if @mouse.feet_on? e
        move_player_on_top @cat, e if @cat.feet_on? e
      end
      if (@cat.x - @mouse.x).abs <= 15.0 && (@cat.y - @mouse.y).abs <= 15.0
        @mouse.dead
        @mouse.reboot
      end
      redraw if @mouse.x <= 0 && (window.button_down? Gosu::KbLeft)
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  #redraw
  def redraw
    @cheeses.each_index do |i|
      y_cord = rand(50..325)
      @cheeses[i].y = y_cord
      @cheeses[i].drawing = true
      @bricks[i].y = y_cord + 36
    end
  end

  #move player on top of brick
  def move_player_on_top player, brick
    player.feet_y = brick.y - 36
  end

  #max scores in level
  def total_scores
    @num * 1000
  end

  #end level
  def end_level
    @cheeses = []
    @bricks = []
    @mouse.reboot
    sleep(3)
  end

end