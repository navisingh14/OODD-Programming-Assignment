class ChangeTimeToTypeInRoomhistories < ActiveRecord::Migration[5.0]
  def up
    change_column :roomhistories, :time_to, :datetime
  end

  def down
    change_column :roomhistories, :time_to, :date
  end
end
