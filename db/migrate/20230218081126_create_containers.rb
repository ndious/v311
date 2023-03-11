# typed: false

## Create Rooms Table
class CreateContainers < ActiveRecord::Migration[7.0]
  def change
    create_table :containers do |t|
      t.belongs_to :room, null: false, foreign_key: true
      t.belongs_to :customer, null: false, foreign_key: true
      t.belongs_to :container, null: true, foreign_key: true
      t.string :name, null: false
      t.string :description
      t.string :photo
      t.belongs_to :code, null: false, foreign_key: true
      t.string :container_code, null: false

      t.timestamps
    end
  end
end
