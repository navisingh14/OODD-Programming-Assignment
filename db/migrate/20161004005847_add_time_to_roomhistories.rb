class AddTimeToRoomhistories < ActiveRecord::Migration[5.0]
  def change
    add_column :roomhistories, :time_from, :datetime
    add_column :roomhistories, :time_to, :datetime
  end
end
