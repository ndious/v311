class AddUniquenessOnUserCodeValue < ActiveRecord::Migration[7.0]
  def change
    add_index :codes, %i[value customer], unique: true
  end
end
