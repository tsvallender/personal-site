class AddWeightToDiaryEntry < ActiveRecord::Migration[7.1]
  def change
    add_column :diary_entries, :weight, :float
  end
end
