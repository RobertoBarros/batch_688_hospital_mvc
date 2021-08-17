class Appointment
  attr_reader :patient, :doctor, :date
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @doctor = attributes[:doctor]
    @patient = attributes[:patient]
    @date = attributes[:date]
  end
end
