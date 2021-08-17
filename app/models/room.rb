class Room
  attr_reader :number, :capacity, :patients
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @number = attributes[:number]
    @capacity = attributes[:capacity] || 0
    @patients = []
  end

  def add_patient(patient)
    @patients << patient
    patient.room = self
  end
end

# Relacionamento 1-n
# room has many patients
# patient belongs to room

# room = Room.new(number: 42)

# roberto = Patient.new(name: 'Roberto', age: 23)

# room.add_patient(roberto)

# room.patients.count # => 1

# room.patients.first.name #=> 'Roberto'

# roberto.room.number # => 42





