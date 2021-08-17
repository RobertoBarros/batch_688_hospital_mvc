class Patient
  attr_reader :name, :age
  attr_accessor :id, :room

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @age = attributes[:age]
  end
end

# roberto = Patient.new(name: 'Roberto')
# roberto = Patient.new(name: 'Roberto', age: 22)
# roberto = Patient.new({name: 'Roberto', age: 22})


