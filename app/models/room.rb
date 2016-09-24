class Room < ApplicationRecord
  validates :number, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false}
end
