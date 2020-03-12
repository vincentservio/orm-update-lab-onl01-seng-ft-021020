require_relative "../config/environment.rb"

class Student
attr_accessor :name, :grade
attr_reader :id
 
  def initialize(id=nil, name, grade)
    @id = id
    @name = name
    @grade = grade
  end
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]


    def self.create_table
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade TEXT
        )
        SQL
    DB[:conn].execute(sql)
  end
  
    def save
      if self.id
    self.update
  else
    sql = <<-SQL
      INSERT INTO students (name, genre)
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.genre)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end
end
end

