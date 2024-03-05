class RemoveLearningGoals < ActiveRecord::Migration[7.1]
  def change
    drop_table :todos
    drop_table :learning_goals
  end
end
