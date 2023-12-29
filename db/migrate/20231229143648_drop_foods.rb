class DropFoods < ActiveRecord::Migration[7.1]
  def change
    drop_table :foods
  end
end
