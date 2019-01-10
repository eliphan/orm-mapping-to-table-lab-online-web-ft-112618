class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  
attr_accessor :name, :grade  
attr_reader :id
  
  def initialize(name, grade, id:nil)
    @name = name
    @grade = grade
  end
  
  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade TEXT
        )
      SQL
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
  end
  
  def save
    sql = <<-SQL 
      INSERT INTO students (name, grade)
      VALUE (?,?)
    SQL 
    
   DB[:conn].execute(sql, self.name, self.grade)
   
  end
  
end
