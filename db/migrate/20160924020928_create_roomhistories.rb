class CreateRoomhistories < ActiveRecord::Migration[5.0]
  def change
    create_table :roomhistories do |t|
      t.string :number
      t.string :userid
      t.date :date
      t.time :time_from
      t.time :time_to

      t.timestamps
    end
  end
end
