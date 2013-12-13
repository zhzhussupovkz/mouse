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
    @drawing = false
    @menu_x, @menu_y, @width = 250, 150, 123
    @interval = 40
  end

  attr_accessor :drawing

  def draw
    if drawing
      @new.draw(@menu_x, @menu_y, 2)
      @save.draw(@menu_x, @menu_y + @interval, 2)
      @exit.draw(@menu_x, @menu_y + 2*@interval, 2)
      @cursor.draw(@window.mouse_x, @window.mouse_y, 3)
   end
  end

  def update
    if @menu_x < @window.mouse_x &&
    @window.mouse_x < @menu_x + @width &&
    @menu_y < @window.mouse_y &&
    @window.mouse_y < @menu_y + @interval && (@window.button_down? Gosu::MsLeft)
      new_game
    elsif @menu_x < @window.mouse_x &&
    @window.mouse_x < @menu_x + @width &&
    @menu_y + @interval < @window.mouse_y &&
    @window.mouse_y < @menu_y + 2*@interval && (@window.button_down? Gosu::MsLeft)
      save_game
    elsif @menu_x < @window.mouse_x &&
    @window.mouse_x < @menu_x + @width &&
    @menu_y + 2*@interval < @window.mouse_y &&
    @window.mouse_y < @menu_y + 3*@interval && (@window.button_down? Gosu::MsLeft)
      exit
    end
  end

  #starting new game
  def new_game
    @drawing= false
    puts "Starting new game..."
    @window.level.num = 0
    @window.level.mouse.score = 0
    @window.level.end_level
    @window.level.start
  end

  #save or load game
  def save_game
    @drawing= false
    puts "Save game..."
    db = Db.new
    score = @window.level.mouse.score
    lvl = @window.level.num
    name = Time.now.strftime("%d/%m/%Y %H:%M")
    db.save_game name, score, lvl
  end

  #exit from game
  def exit
    @drawing= false
    @window.close
  end

end
