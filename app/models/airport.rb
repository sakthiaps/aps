class Airport < ApplicationRecord
  has_one :flight, :inverse_of => :origin
  has_one :flight, :inverse_of => :destination
  has_many :seat_configurations, :inverse_of => :seat_category,
           :dependent => :delete_all

  def self.list_airports
    Airport.all.map{|airport| [airport.name_with_state, airport.id]}
  end

  def name_with_state
    self.name + ", " + self.state
  end

end
