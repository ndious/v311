# typed: false
class Room < ApplicationRecord
  belongs_to :customer
  has_many :containers
end
