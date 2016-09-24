class AddSuperAdminToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :superadmin, :boolean , default: false
  end
end
