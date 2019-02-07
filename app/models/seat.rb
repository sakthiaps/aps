# -*- coding: utf-8 -*-
# +-----------------------+--------------+------+-----+---------+----------------+
# | Field                 | Type         | Null | Key | Default | Extra          |
# +-----------------------+--------------+------+-----+---------+----------------+
# | id                    | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | seat_configuration_id | bigint(20)   | YES  | MUL | NULL    |                |
# | pnr_number            | varchar(255) | YES  | MUL | NULL    |                |
# | booked                | tinyint(1)   | YES  |     | 0       |                |
# +-----------------------+--------------+------+-----+---------+----------------+

class Seat < ApplicationRecord
  belongs_to :seat_configuration, :inverse_of => :seats

  scope :available_seats, lambda { |seat_configuration_id|
    where("seats.seat_configuration_id =? AND seats.booked IS FALSE", seat_configuration_id)
  }

  scope :available, lambda {
    where("seats.booked IS FALSE")
  }

end
