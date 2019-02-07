class ChangeDataTypeForFlightSourceAndDestination < ActiveRecord::Migration[5.2]

  def up
    change_table(:flights, :bulk => true) do |t|
      t.remove :origin_id
      t.remove :destination_id
    end

    change_table(:flights, :bulk => true) do |t|
      t.integer :origin_id
      t.integer :destination_id
    end
  end

end
