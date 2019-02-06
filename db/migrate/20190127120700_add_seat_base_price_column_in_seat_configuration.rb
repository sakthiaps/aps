class AddSeatBasePriceColumnInSeatConfiguration < ActiveRecord::Migration[5.2]

  def up
    add_column(:seat_configurations, :base_amount, 'decimal(9,2)')
  end

  def down
    remove_column(:seat_configurations, :base_amount)
  end

end
