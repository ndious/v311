# typed: false
class AddCustomerLoginIndexAndUniqueness < ActiveRecord::Migration[7.0]
  def change
    add_index :customers, :login, :unique => true
  end
end
