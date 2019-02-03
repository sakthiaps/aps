class Flight < ApplicationRecord
  belongs_to :airplane, :inverse_of => :flights
  has_many :seat_configurations, :through => :airplane
  belongs_to :origin, :inverse_of => :flight,
             :class_name => 'Airport',
             :foreign_key => :origin_id

  belongs_to :destination, :inverse_of => :flight,
             :class_name => 'Airport',
             :foreign_key => :destination_id

  validates :flight_number, :presence => true
end
