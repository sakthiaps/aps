class AddDefaultAirports < ActiveRecord::Migration[5.2]

  def up
    Airport.create({:name => "Chennai", :state => "Tamilnadu"})
    Airport.create({:name => "Madurai", :state => "Tamilnadu"})
    Airport.create({:name => "Trichy", :state => "Tamilnadu"})
    Airport.create({:name => "Coimbatore", :state => "Tamilnadu"})
  end

  def down
    Airport.destroy_all
  end
end
