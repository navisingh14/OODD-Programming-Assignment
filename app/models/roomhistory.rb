class Roomhistory < ApplicationRecord
  belongs_to :user
  belongs_to :library_room
end
