class RenameAtOnExercises < ActiveRecord::Migration[7.1]
  def change
    remove_column :exercises, :at
    add_column :exercises, :occurred_at, :datetime
  end
end
