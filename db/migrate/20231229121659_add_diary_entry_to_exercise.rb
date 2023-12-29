class AddDiaryEntryToExercise < ActiveRecord::Migration[7.1]
  def change
    add_reference :exercises, :diary_entry, null: false, foreign_key: true
  end
end
