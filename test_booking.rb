# Test core booking rules

bookings = []

# Test 1: Add booking
booking1 = { name: "Kebede", lab: "Lab 1", time: "10:00" }
bookings << booking1
puts bookings.include?(booking1) ? "Test 1 Passed ✅" : "Test 1 Failed ❌"

# Test 2: Prevent duplicate
booking2 = { name: "Bob", lab: "Lab 1", time: "10:00" }
if bookings.any? { |b| b[:lab] == booking2[:lab] && b[:time] == booking2[:time] }
  puts "Test 2 Passed ✅ (duplicate prevented)"
else
  bookings << booking2
  puts "Test 2 Failed ❌ (duplicate added)"
end

# Test 3: View bookings
if bookings.empty?
  puts "Test 3 Failed ❌"
else
  bookings.each_with_index do |b, i|
    puts "#{i+1}. #{b[:name]} - #{b[:lab]} at #{b[:time]}"
  end
  puts "Test 3 Passed ✅"
end

