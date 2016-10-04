class RemoveTimeFromRoomhistories < ActiveRecord::Migration[5.0]
  def change
    remove_column :roomhistories, :time_from
    remove_column :roomhistories, :time_to
  end
end
