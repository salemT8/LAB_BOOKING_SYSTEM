require_relative 'user'
require_relative 'resource'
require_relative 'booking'

user1 = User.new(id: 1, name: "Abel", role: "student")
user2 = User.new(id: 2, name: "Sara", role: "student")

projector = Resource.new(id: 1, name: "Projector", category: "equipment")
laptop = Resource.new(id: 2, name: "Laptop", category: "equipment")

booking1 = Booking.new(user: user1, resource: projector)
puts "Booking1 created"

begin
  booking2 = Booking.new(user: user2, resource: projector)
rescue => e
  puts e.message
end

booking1.cancel
puts "Booking1 cancelled"

booking3 = Booking.new(user: user2, resource: projector)
puts "Booking3 created"