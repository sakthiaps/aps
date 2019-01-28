class AddDefaultRole < ActiveRecord::Migration[5.2]
  def up
    Role.create({:name => 'Admin'})
    Role.create({:name => 'User'})
  end

  def down
    Role.destroy_all
  end

end
