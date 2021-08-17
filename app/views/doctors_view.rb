class DoctorsView
  def ask_name
    puts 'Enter doctor name:'
    gets.chomp.strip
  end

  def ask_doctor_id
    puts "Enter doctor ID:"
    gets.chomp.to_i
  end

  def list(doctors)
    system 'clear'  # This don't work in rake specs
    puts 'Doctors List'
    doctors.each do |doctor|
      puts "ID: #{doctor.id} - Doctor: #{doctor.name}"
    end
    puts '-' * 30
    puts "\n\n"
    puts 'Press enter to continue...'
    gets  # This don't work in rake specs
  end
end
