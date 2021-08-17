require_relative '../views/patients_view'

class PatientsController
  def initialize(patient_repository, room_repository)
    @patient_repository = patient_repository
    @room_repository = room_repository
    @view = PatientsView.new
    @room_view = RoomsView.new
  end

  def create
    name = @view.ask_name
    age = @view.ask_age

    rooms = @room_repository.all
    @room_view.list(rooms)

    room_id = @room_view.ask_room_id

    room = @room_repository.find_by_id(room_id)

    patient = Patient.new(name: name, age: age)

    room.add_patient(patient)


    @patient_repository.add(patient)
  end

  def list
    patients = @patient_repository.all
    @view.list(patients)
  end
end