class Airport < ApplicationRecord

  has_many :flights, :inverse_of => :origin,
           :class_name => 'Airport',
           :foreign_key => :origin_id

  has_many :flights, :inverse_of => :destination,
           :class_name => 'Airport',
           :foreign_key => :destination_id

  def self.list_airports
    Airport.all.map{|airport| [airport.name_with_state, airport.id]}
  end

  def name_with_state
    self.name + ", " + self.state
  end

end
