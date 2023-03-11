# typed: false
class Item < ApplicationRecord
  belongs_to :container
  belongs_to :customer
  belongs_to :code

  validates_presence_of :container
  validates_presence_of :customer
  validates_presence_of :code

  before_create :setup_item

  after_create :update_code

  private

  def update_code
    code.item!
  end

  def setup_item
    code.save if code.is_new?

    self.item_code = code.value
    self.is_deleted = false
    self.is_sold = false
  end
end
