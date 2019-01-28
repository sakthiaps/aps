class AddSeatCategories < ActiveRecord::Migration[5.2]
  def up
    SeatCategory.create({:name => "First Class"})
    SeatCategory.create({:name => "Business Class"})
    SeatCategory.create({:name => "Economy Class"})
  end

  def down
    SeatCategory.destroy_all
  end
end
