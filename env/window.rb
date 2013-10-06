#main window
class MyWindow < Gosu::Window

  def initialize
    super 640, 480, false
    self.caption = 'Mouse Game'
    @bg = Gosu::Image.new(self, 'images/bg.png', true);
    @music = Gosu::Song.new(self, 'sounds/music.ogg')
    @music.play(looping = true)

    @mouse = Mouse.new(self, 520, 375)
    @level = Level.new(self, 1)
    @level.start
  end

  def update
    @mouse.move_left if button_down? Gosu::KbLeft
    @mouse.move_right if button_down? Gosu::KbRight
    @mouse.up if button_down? Gosu::KbUp or button_down? Gosu::KbSpace
    @mouse.down
    @mouse.move
  end

  def draw
    @level.draw
    @mouse.draw
    @bg.draw(0, 0, 0)
  end

  def button_down(key)
    if key == Gosu::KbEscape
      @music.stop
      close
    end
  end
end