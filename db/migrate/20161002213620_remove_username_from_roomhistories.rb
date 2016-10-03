class RemoveUsernameFromRoomhistories < ActiveRecord::Migration[5.0]
  def change
    remove_column :roomhistories, :username, :string
  end
end
