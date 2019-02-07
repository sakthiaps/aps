# -*- coding: utf-8 -*-
# +----------------+--------------+------+-----+---------+----------------+
# | Field          | Type         | Null | Key | Default | Extra          |
# +----------------+--------------+------+-----+---------+----------------+
# | id             | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | airplane_id    | bigint(20)   | NO   | MUL | NULL    |                |
# | flight_number  | varchar(255) | YES  |     | NULL    |                |
# | origin_id      | varchar(255) | YES  |     | NULL    |                |
# | destination_id | varchar(255) | YES  |     | NULL    |                |
# | date           | datetime     | YES  |     | NULL    |                |
# | created_at     | datetime     | NO   |     | NULL    |                |
# | updated_at     | datetime     | NO   |     | NULL    |                |
# +----------------+--------------+------+-----+---------+----------------+

class Flight < ApplicationRecord
  belongs_to :airplane, :inverse_of => :flights

  has_many :seat_configurations, :through => :airplane

  belongs_to :origin, :inverse_of => :flights,
             :class_name => 'Airport',
             :foreign_key => :origin_id

  belongs_to :destination, :inverse_of => :flights,
             :class_name => 'Airport',
             :foreign_key => :destination_id

  validates :flight_number, :presence => true

end
