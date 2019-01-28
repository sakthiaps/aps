class Airplane < ApplicationRecord
  has_many :seat_configurations, :inverse_of => :airplane,
           :dependent => :delete_all
  has_many :seat_categories, :through => :seat_configurations,
           :dependent => :delete_all
  has_many :flights, :inverse_of => :airplane,
           :dependent => :delete_all

  accepts_nested_attributes_for :seat_configurations, allow_destroy: true

  def self.list_of_airplanes
    Airplane.all.map{|airplane| [airplane.name, airplane.id]}
  end
end
