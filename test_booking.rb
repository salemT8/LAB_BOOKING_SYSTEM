require 'minitest/autorun'
require_relative '../user'
require_relative '../resource'
require_relative '../booking'

class BookingTest < Minitest::Test

  def setup
    @user = User.new(id: 1, name: "Test", role: "student")
    @resource = Resource.new(id: 1, name: "Projector", category: "equipment")
  end

  def test_booking_available_resource
    booking = Booking.new(user: @user, resource: @resource)
    assert_equal "active", booking.status
  end

  def test_booking_unavailable_resource
    Booking.new(user: @user, resource: @resource)

    assert_raises(BookingError) do
      Booking.new(user: @user, resource: @resource)
    end
  end

  def test_cancel_booking_changes_status
    booking = Booking.new(user: @user, resource: @resource)
    booking.cancel

    assert_equal "cancelled", booking.status
  end

  def test_cancel_makes_resource_available
    booking = Booking.new(user: @user, resource: @resource)
    booking.cancel

    assert_equal true, @resource.available?
  end
end