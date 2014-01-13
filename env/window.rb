=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#main window
class MyWindow < Gosu::Window

  def initialize
    begin
      puts "Start environment..."
      super 640, 480, false
      self.caption = 'Mouse Game'
      @bg = Gosu::Image.new(self, 'images/level/bg.png', true);
      @music = Gosu::Song.new(self, 'sounds/music.ogg')
      puts "Create game music..."
      @music.play(looping = true)
      @menu = Menu.new(self)
      @level = Level.new(self)
      @level.start
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :level, :music

  #game logic
  def update
    begin
      if not @level.game_over
        @level.update
        @menu.update
      end
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  def draw
    begin
      @level.draw
      @menu.draw
      @bg.draw(0, 0, 0)
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  def button_down(key)
    case key
    when Gosu::KbEscape
      @music.stop
      close
      puts "Exit."
    when Gosu::KbBackspace
      @menu.drawing= !@menu.drawing
      @level.pause= !@level.pause
    end
  end

end