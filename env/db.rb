=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#class Db
require "sqlite3"

class Db

  def initialize
    @db = SQLite3::Database.open(File.dirname(__FILE__) + "/../db/mouse.db")
    @table = 'game'
  end

  attr_reader :db, :table

  #save game to db
  def save_game name, score, level
    begin
      db.execute "INSERT INTO #{table}(name, score, level) VALUES (#{name}, #{score}, #{level})"

    rescue SQLite3::Exception => e
      puts "Database Exception occured"
      puts e
    
    ensure
      db.close if db
    end
  end

  #load game from db
  def load_game
    begin
      id = db.last_insert_row_id
      stm = db.prepare "SELECT * FROM #{table} WHERE id = #{id}"
      rs = stm.execute

      row = rs.next

    rescue SQLite3::Exception => e
      puts "Database Exception occured"
      puts e
    
    ensure
      stm.close if stm
      db.close if db
    end
  end

end
