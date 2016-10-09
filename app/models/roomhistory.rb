class Roomhistory < ApplicationRecord
  belongs_to :member
  belongs_to :room
end
