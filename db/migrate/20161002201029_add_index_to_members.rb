class AddIndexToMembers < ActiveRecord::Migration[5.0]
  def change
    add_index :members, :username, unique: true
  end
end