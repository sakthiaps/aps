class Seat < ApplicationRecord
  belongs_to :seat_configuration, :inverse_of => :seats

  scope :available, lambda { |seat|
    where("seats.seat_configuration_id =? AND seats.booked IS FALSE", seat.seat_configuration_id)
  }

end
