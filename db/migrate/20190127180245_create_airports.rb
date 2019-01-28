class CreateAirports < ActiveRecord::Migration[5.2]

  def up
    create_table :airports do |t|
      t.string :name
      t.string :state

      t.timestamps null: false
    end
  end

  def down
    drop_table :airports
  end
end
