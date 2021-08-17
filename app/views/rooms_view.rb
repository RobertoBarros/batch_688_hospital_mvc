class RoomsView
  def ask_number
    puts 'Enter the room number:'
    gets.chomp.to_i
  end

  def ask_capacity
    puts 'Enter the room capacity:'
    gets.chomp.to_i
  end

  def ask_room_id
    puts 'Enter room ID:'
    gets.chomp.to_i
  end

  def list(rooms)
    system 'clear' # This don't work in rake specs
    puts 'Rooms List'
    rooms.each do |room|
      puts "ID: #{room.id} - Room Number #{room.number}: #{room.capacity} patients capacity | Patients: #{ room.patients.map { |patient| patient.name }.join(',') }"
    end
    puts '-' * 30
    puts "\n\n"
    puts 'Press enter to continue...'
    gets  # This don't work in rake specs
  end
end
