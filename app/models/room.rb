class Room < ApplicationRecord
  has_many :member
  validates :number, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false}

 end
