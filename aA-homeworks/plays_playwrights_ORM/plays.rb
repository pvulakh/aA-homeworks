require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database #don't need to write one for Playwrights bc plays.db  includes both tables 
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end



class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    #store play in array
    play = PlayDBConnection.instance.execute(<<-SQL, title) 
      SELECT 
        * 
      FROM 
        plays 
      WHERE 
        title = ?
    SQL
    
    return nil unless play.length > 0 #check if play found 
    Play.new(play.first) #unpack array, create play instance from data
  end

  def self.find_by_playwright(name)
    play = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT 
        * 
      FROM 
        plays 
      WHERE 
        playwright_id = (
          SELECT 
            id 
          FROM 
            playwrights
          WHERE 
            name = ? 
        )
    SQL

    return nil unless play.length > 0
    Play.new(play.first)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright 
  attr_accessor :id, :name, :birth_year 

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_name(name)
    playwright = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT 
        *
      FROM 
        playwrights 
      WHERE
        name = ?
    SQL
    
    return nil unless playwright.length > 0 
    Playwright.new(playwright.first)
  end 

  def initialize(options)
    @name, @birth_year = options[name], options[birth_year]
  end 

  def create
    raise "#{self} already in database" if self.id

    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL 
    
    self.id = PlayDBConnection.instance.last_insert_row_id
  end 
end 
