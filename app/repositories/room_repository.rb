require_relative '../models/room'

class RoomRepository
  CSV_OPTIONS = {headers: :first_row, header_converters: :symbol}

  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
    load_csv
    @next_id = @rooms.empty? ? 1 : @rooms.last.id + 1
  end

  def add(room)
    room.id = @next_id
    @rooms << room
    save_csv
    @next_id += 1
  end

  def all
    @rooms
  end

  def find_by_id(id)
    @rooms.select { |room| room.id == id }.first # First é para retornar o único quarto dentro do array
  end

  def load_csv
    CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
      room = Room.new(id: row[:id].to_i, number: row[:number].to_i, capacity: row[:capacity].to_i)
      @rooms << room
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb', CSV_OPTIONS) do |file|

      file << %i[id number capacity] # CSV HEADER

      @rooms.each do |room|
        file << [room.id, room.number, room.capacity]
      end
    end
  end

end