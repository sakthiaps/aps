class Flight < ApplicationRecord
  belongs_to :airplane, :inverse_of => :flights
  has_many :seat_configurations, :inverse_of => :seat_category,
           :dependent => :delete_all
  belongs_to :origin, :inverse_of => :flight,
             :class_name => 'Airport',
             :foreign_key => :origin_id

  belongs_to :destination, :inverse_of => :flight,
             :class_name => 'Airport',
             :foreign_key => :destination_id
end
