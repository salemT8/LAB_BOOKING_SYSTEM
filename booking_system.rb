puts "Welcome to Booking System"

bookings = []

def menu
  puts "\n--- Booking System ---"
  puts "1. Add Booking"
  puts "2. View Bookings"
  puts "3. Exit"
  print "Choose an option: "
end

loop do
  menu
  choice = gets.chomp.to_i

  if choice == 1
    print "Enter your name: "
    name = gets.chomp

    print "Enter lab: "
    lab = gets.chomp

    print "Enter time: "
    time = gets.chomp

    booking = { name: name, lab: lab, time: time }
    bookings << booking

    puts " Booking added!"

  elsif choice == 2
    if bookings.empty?
      puts "No bookings yet."
    else
      bookings.each_with_index do |b, i|
        puts "#{i+1}. #{b[:name]} - #{b[:lab]} at #{b[:time]}"
      end
    end

  elsif choice == 3
    puts "Chawww!"
    break

  else
    puts "Invalid option. Try again."
  end
end