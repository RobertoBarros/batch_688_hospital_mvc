require_relative '../models/doctor'

class DoctorRepository
  CSV_OPTIONS = {headers: :first_row, header_converters: :symbol}

  def initialize(csv_file)
    @csv_file = csv_file
    @doctors = []
    load_csv
    @next_id = @doctors.empty? ? 1 : @doctors.last.id + 1
  end

  def add(doctor)
    doctor.id = @next_id
    @doctors << doctor
    save_csv
    @next_id += 1
  end

  def all
    return @doctors
  end

  def find_by_id(id)
    @doctors.select { |doctor| doctor.id == id }.first
  end


  def load_csv
    CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
      doctor = Doctor.new(id: row[:id].to_i, name: row[:name])
      @doctors << doctor
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb', CSV_OPTIONS) do |file|

      file << %i[id name] # CSV HEADER

      @doctors.each do |doctor|
        file << [doctor.id, doctor.name]
      end
    end
  end


end