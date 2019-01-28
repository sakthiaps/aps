class AddUserRoleInUsers < ActiveRecord::Migration[5.2]

  def up
    change_table :users do |t|
      t.references :role, index: true, :foriegn_key => true
    end
  end

  def down
    change_table :users do |t|
      t.remove :role
    end
  end
end
