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



end
