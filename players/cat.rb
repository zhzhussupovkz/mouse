#class Cat
class Cat < Player

  def initialize window, x, y
    super window, x, y, "images/cat.png", "images/cat-r.png"
    @beep = Gosu::Sample.new(window, "sounds/kitten.wav")
    puts "Create cat..."
  end

  attr_writer :x, :y

  #cat say meow
  def meow
    @beep.play
  end

end