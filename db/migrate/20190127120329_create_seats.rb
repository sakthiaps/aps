class CreateSeats < ActiveRecord::Migration[5.2]

  def up
    create_table :seats do |t|
      t.references :seat_configuration, :foreign_key => true, :index => true
      t.string :pnr_number, unique: true, :index => true
      t.boolean :booked, :default => false
    end
  end

  def down
    drop_table :seats
  end

end
