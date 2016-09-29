class ChangeTimeFromTypeInRoomhistories < ActiveRecord::Migration[5.0]
    def up
      change_column :roomhistories, :time_from, :datetime
    end

    def down
      change_column :roomhistories, :time_from, :date
    end
end
