require_relative '../models/appointment'

class AppointmentRepository
  CSV_OPTIONS = { headers: :first_row, header_converters: :symbol }

  def initialize(csv_file, patient_repository, doctor_repository)
    @patient_repository = patient_repository
    @doctor_repository = doctor_repository
    @csv_file = csv_file
    @appointments = []
    load_csv
    @next_id = @appointments.empty? ? 1 : @appointments.last.id + 1
  end

  def add(appointment)
    appointment.id = @next_id
    @appointments << appointment
    save_csv
    @next_id += 1
  end

  def all
    @appointments
  end

  def load_csv
    CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
      doctor_id = row[:doctor_id].to_i
      patient_id = row[:patient_id].to_i

      doctor = @doctor_repository.find_by_id(doctor_id)
      patient = @patient_repository.find_by_id(patient_id)

      appointment = Appointment.new(id: row[:id].to_i, date: row[:date], doctor: doctor, patient: patient)


      @appointments << appointment
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb', CSV_OPTIONS) do |file|
      file << %i[id date patient_id doctor_id] # CSV HEADER

      @appointments.each do |appointment|
        file << [appointment.id, appointment.date, appointment.patient.id, appointment.doctor.id]
      end
    end
  end
end
