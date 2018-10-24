require_relative("../db/sql_runner.rb")

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :age, :house

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @house = options['house']
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, age, house)
      VALUES ($1, $2, $3, $4)
      RETURNING id"
    values = [@first_name, @last_name, @age, @house]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first()['id'].to_i
  end

  def self.find_all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    results = students.map{|student| Student.new(student)}
    return results
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values).first
    result = Student.new(student)
    return result
  end

end
