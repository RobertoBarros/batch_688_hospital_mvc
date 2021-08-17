require 'csv'

require_relative 'app/repositories/patient_repository'
require_relative 'app/controllers/patients_controller'

require_relative 'app/repositories/room_repository'
require_relative 'app/controllers/rooms_controller'

require_relative 'app/repositories/doctor_repository'
require_relative 'app/controllers/doctors_controller'

require_relative 'app/repositories/appointment_repository'
require_relative 'app/controllers/appointments_controller'

require_relative 'router'

room_repository = RoomRepository.new('data/rooms.csv')
patient_repository = PatientRepository.new('data/patients.csv', room_repository)
doctor_repository = DoctorRepository.new('data/doctors.csv')
appointment_repository = AppointmentRepository.new('data/appointments.csv', patient_repository, doctor_repository)

patients_controller = PatientsController.new(patient_repository, room_repository)
rooms_controller = RoomsController.new(room_repository)
doctors_controller = DoctorsController.new(doctor_repository)
appointments_controller = AppointmentsController.new(appointment_repository, doctor_repository, patient_repository)

router = Router.new(patients_controller, rooms_controller, doctors_controller, appointments_controller)

router.run
