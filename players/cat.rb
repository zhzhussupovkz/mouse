=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#class Cat
class Cat < Player

  def initialize window, x, y
    super window, x, y, "images/players/cat.png", "images/players/cat-r.png"
    @beep = Gosu::Sample.new(window, "sounds/kitten.wav")
    puts "Create cat..."
  end

  attr_writer :x, :y

  #cat say meow
  def meow
    @beep.play
  end

end