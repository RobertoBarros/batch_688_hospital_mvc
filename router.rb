class Router

  def initialize(patients_controller, rooms_controller, doctors_controller, appointments_controller)
    @patients_controller = patients_controller
    @rooms_controller = rooms_controller
    @doctors_controller = doctors_controller
    @appointments_controller = appointments_controller
  end


  def run
    loop do
      print_actions
      action = gets.chomp.to_i
      dispatch(action)
    end
  end


  private

  def print_actions
    system "clear"
    puts ("-" * 10) + 'Patients' + ('-' * 10)
    puts "1. Create Patient"
    puts "2. List Patients"

    puts ("-" * 10) + 'Rooms' + ('-' * 10)
    puts "3. Create Room"
    puts "4. List Rooms"
    puts ("-" * 10) + 'Doctors' + ('-' * 10)
    puts "5. Create Doctor"
    puts "6. List Doctors"
    puts ("-" * 10) + 'Doctors' + ('-' * 10)
    puts "7. Create Appointment"
    puts "8. List Appointment"

    puts '-' * 30
    puts "Choose an option:"
  end

  def dispatch(action)
    case action
    when 1 then @patients_controller.create
    when 2 then @patients_controller.list

    when 3 then @rooms_controller.create
    when 4 then @rooms_controller.list

    when 5 then @doctors_controller.create
    when 6 then @doctors_controller.list

    when 7 then @appointments_controller.create
    when 8 then @appointments_controller.list

    end

  end

end