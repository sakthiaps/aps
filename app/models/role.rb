# -*- coding: utf-8 -*-
# +-------+--------------+------+-----+---------+----------------+
# | Field | Type         | Null | Key | Default | Extra          |
# +-------+--------------+------+-----+---------+----------------+
# | id    | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | name  | varchar(255) | YES  |     | NULL    |                |
# +-------+--------------+------+-----+---------+----------------+

class Role < ApplicationRecord

  ADMIN = 1
  USER = 2

end
