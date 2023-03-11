# typed: false

## Create customenrs table
class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :login

      t.timestamps
    end
  end
end