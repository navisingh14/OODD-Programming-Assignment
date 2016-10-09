class Roomhistory < ApplicationRecord
  has_and_belongs_to_many :members
  has_and_belongs_to_many :rooms
end
