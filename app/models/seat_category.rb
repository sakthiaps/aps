# -*- coding: utf-8 -*-
# +-------+--------------+------+-----+---------+----------------+
# | Field | Type         | Null | Key | Default | Extra          |
# +-------+--------------+------+-----+---------+----------------+
# | id    | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | name  | varchar(255) | YES  |     | NULL    |                |
# +-------+--------------+------+-----+---------+----------------+

class SeatCategory < ApplicationRecord
  has_many :seat_configurations, :inverse_of => :seat_category,
           :dependent => :delete_all

  FIRST_CLASS = 1
  BUSINESS_CLASS = 2
  ECONOMY_CLASS = 3

end
