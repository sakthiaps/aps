class Seat < ApplicationRecord
  belongs_to :seat_configuration, :inverse_of => :seats

  scope :available_seats, lambda { |seat_configuration_id|
    where("seats.seat_configuration_id =? AND seats.booked IS FALSE", seat_configuration_id)
  }

  scope :available, lambda {
    where("seats.booked IS FALSE")
  }

end
