class Code < ApplicationRecord
  enum :scope, { unassigned: 0, room: 1, container: 2, item: 3, is_new: 9 }
  belongs_to :customer

  validates_uniqueness_of :value, scope: :customer

  validates_presence_of :value
  validates_presence_of :customer

  before_create :set_code_unassigned

  class << self
    def generate_code(save_code, customer)
      chars = ['A'..'Z', '0'..'9'].map(&:to_a).flatten
      value = Array.new(6).map { chars[rand(chars.size)] }.join

      code = Code.new value:, customer:, scope: Code.scopes[:unassigned]

      code.save if save_code

      code
    end
  end

  private

  def set_code_unassigned
    self.scope = Code.scopes[:unassigned] if is_new?
  end
end
