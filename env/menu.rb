=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#class Menu
class Menu

  def initialize window
    @window = window
    @new = Gosu::Image.new(@window, "images/menu/new.png", false)
    @save = Gosu::Image.new(@window, "images/menu/save.png", false)
    @exit = Gosu::Image.new(@window, "images/menu/exit.png", false)
    @cursor = Gosu::Image.new(@window, 'images/menu/cursor.png')
    @drawing = true
  end

  attr_accessor :drawing

  def draw
    if drawing
      @new.draw(250, 150, 2)
      @save.draw(250,190, 2)
      @exit.draw(250, 230, 2)
      @cursor.draw(@window.mouse_x, @window.mouse_y, 3)
   end
  end

end