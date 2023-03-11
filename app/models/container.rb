# typed: false

## ActiveRecord Room Model Object
class Container < ApplicationRecord
  # scope :available_stock, -> { where(:items { is_deleted: false, is_sold: false }) }

  belongs_to :room
  belongs_to :customer
  belongs_to :code
  belongs_to :parent, class_name: 'Container', foreign_key: 'parent_id', optional: true

  has_many :items, -> { where(is_deleted: false, is_sold: false) }
  has_many :children, class_name: 'Container'

  validates_presence_of :code
  validates_presence_of :customer
  validates_presence_of :room

  before_create :setup_container

  after_create :update_code

  private

  def update_code
    code.container!
  end

  def setup_container
    code.save if code.is_new?

    self.container_code = code.value
  end
end
