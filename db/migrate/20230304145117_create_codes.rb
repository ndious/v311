class CreateCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :codes do |t|
      t.string :value
      t.integer :scope, default: 0
      t.belongs_to :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
