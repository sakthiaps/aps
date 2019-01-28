class CreateFlights < ActiveRecord::Migration[5.2]

  def up
    create_table :flights do |t|
      t.references :airplane, :foreign_key => true, :null => false, :index => true
      t.string :flight_number
      t.string :origin_id
      t.string :destination_id
      t.datetime :date

      t.timestamps null: false
    end
  end

  def down
    drop_table :flights
  end
end
