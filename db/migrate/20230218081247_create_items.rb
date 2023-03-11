# typed: false

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.belongs_to :container, null: false, foreign_key: true
      t.belongs_to :customer, null: false, foreign_key: true
      t.belongs_to :code, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.string :picture
      t.string :item_code
      t.integer :quantity, default: 1, null: false
      t.boolean :is_sold, default: false
      t.boolean :is_deleted, default: false

      t.timestamps
    end
  end
end
