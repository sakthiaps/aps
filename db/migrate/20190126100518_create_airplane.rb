class CreateAirplane < ActiveRecord::Migration[5.2]
  def up
    create_table :airplanes do |t|
      t.string :name
      t.string :type
    end
  end

  def down
    drop_table :airplanes
  end

end
