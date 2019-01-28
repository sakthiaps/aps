class CreateSeatConfigurations < ActiveRecord::Migration[5.2]
  def up
    create_table :seat_configurations do |t|
      t.references :airplane, :foreign_key => true, :null => false
      t.references :seat_category, :foreign_key => true, :null => false
      t.integer :number_of_rows
      t.integer :seats_in_row
    end
  end

  def down
    drop_table :seat_configurations
  end

end
