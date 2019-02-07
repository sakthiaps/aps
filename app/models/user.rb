# +-----------------+--------------+------+-----+---------+----------------+
# | Field           | Type         | Null | Key | Default | Extra          |
# +-----------------+--------------+------+-----+---------+----------------+
# | id              | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | name            | varchar(255) | YES  |     | NULL    |                |
# | email           | varchar(255) | YES  |     | NULL    |                |
# | password_digest | varchar(255) | YES  |     | NULL    |                |
# | created_at      | datetime     | NO   |     | NULL    |                |
# | updated_at      | datetime     | NO   |     | NULL    |                |
# | role_id         | bigint(20)   | YES  | MUL | 2       |                |
# +-----------------+--------------+------+-----+---------+----------------+

class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  }
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40}


  def is_admin?
    self.role_id == Role::ADMIN
  end

end
