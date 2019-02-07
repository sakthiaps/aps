# -*- coding: utf-8 -*-
#+---------------+--------------+------+-----+---------+----------------+
#| Field         | Type         | Null | Key | Default | Extra          |
#+---------------+--------------+------+-----+---------+----------------+
#| id            | bigint(20)   | NO   | PRI | NULL    | auto_increment |
#| name          | varchar(255) | YES  |     | NULL    |                |
#| airplane_type | varchar(255) | YES  |     | NULL    |                |
#+---------------+--------------+------+-----+---------+----------------+

class Airplane < ApplicationRecord
  has_many :seat_configurations, :inverse_of => :airplane,
           :dependent => :destroy

  has_many :flights, :inverse_of => :airplane,
           :dependent => :destroy

  accepts_nested_attributes_for :seat_configurations, allow_destroy: true

  validates :name, :presence => true
  validates :airplane_type, :presence => true

  def self.list_of_airplanes
    Airplane.all.map{|airplane| [airplane.name, airplane.id]}
  end

end
