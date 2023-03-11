# typed: false

## Customer Model
class Customer < ApplicationRecord
  has_many :containers
  has_many :rooms
  has_many :codes
  has_many :items
end
