class Pokemon
  
  attr_accessor :name, :type, :db, :hp
  attr_reader :id
  
  def initialize(name)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL 
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
    SQL
    
    db.execute(sql, name, type)
    
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(id, db)
    sql = <<-SQL 
    SELECT * 
    FROM pokemon 
    WHERE id = ? 
    SQL
    db.execute(sql, id).map do |row| 
      Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)
  end.first 
end
  




end

