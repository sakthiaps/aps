class Seat < ApplicationRecord
  belongs_to :seat_configuration, :inverse_of => :seats
end
