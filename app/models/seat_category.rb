class SeatCategory < ApplicationRecord
  has_many :seat_configurations, :inverse_of => :seat_category,
           :dependent => :delete_all
end
