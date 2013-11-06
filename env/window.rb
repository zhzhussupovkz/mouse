#main window
class MyWindow < Gosu::Window

  def initialize
    puts "Start environment..."
    super 640, 480, false
    self.caption = 'Mouse Game'
    @bg = Gosu::Image.new(self, 'images/bg.png', true);
    @music = Gosu::Song.new(self, 'sounds/music.ogg')
    puts "Create game music..."
    @music.play(looping = true)
    @level = Level.new(self)
    @level.start
  end

  #game logic
  def update
    @level.update
  end

  def draw
    @level.draw
    @bg.draw(0, 0, 0)
  end

  def button_down(key)
    case key
    when Gosu::KbEscape
      @music.stop
      close
      puts "Exit."
    end
  end

end