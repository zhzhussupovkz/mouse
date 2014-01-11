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
      @mouse = Mouse.new(@window, 520, 375)
      @cheeses = []
      @bricks = []
      @pause = false
      @ct = Time.now.to_i
      @ui = Gosu::Font.new(@window, 'Monaco', 25)
      @c = Gosu::Font.new(@window, 'Monaco', 15)
      @collect = Gosu::Song.new(window, 'sounds/collect.ogg')
      puts "Initialize levels..."
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :ui, :mouse, :window
  attr_accessor :bricks, :cheeses, :num, :pause

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
      @mouse.move_left if @window.button_down? Gosu::KbLeft
      @mouse.move_right if @window.button_down? Gosu::KbRight
      @mouse.up if @window.button_down? Gosu::KbUp or @window.button_down? Gosu::KbSpace
      @mouse.down if @mouse.on_ground == false
      @mouse.move
      @cheeses.each do |e|
        if (e.x - @mouse.x).abs <= 15.0 && (e.y - @mouse.y).abs <= 15.0 && e.drawing
          e.drawing = false
          window.music.pause
          @ct = Time.now.to_i
          @collect.play(looping = false)
          @mouse.add_score
        end
      end
      window.music.play if Time.now.to_i >= @ct + 1.2
      @bricks.each do |e|
        move_player_on_top e if @mouse.feet_on? e
      end
      redraw if @mouse.x <= 1
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
  def move_player_on_top brick
    @mouse.feet_y = brick.y - 36
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