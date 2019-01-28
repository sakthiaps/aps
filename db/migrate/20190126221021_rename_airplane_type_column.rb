class RenameAirplaneTypeColumn < ActiveRecord::Migration[5.2]
  def up
    rename_column(:airplanes, :type, :airplane_type)
  end

  def down
    rename_column(:airplanes, :airplane_type, :type)
  end
end
