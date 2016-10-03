class AddMultibookToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :multibook, :boolean, default: false
  end
end
