require_relative '../views/doctors_view'

class DoctorsController
  def initialize(doctor_repository)
    @doctor_repository = doctor_repository
    @view = DoctorsView.new
  end

  def create
    name = @view.ask_name
    doctor = Doctor.new(name: name)
    @doctor_repository.add(doctor)
  end

  def list
    doctors = @doctor_repository.all
    @view.list(doctors)
  end

end