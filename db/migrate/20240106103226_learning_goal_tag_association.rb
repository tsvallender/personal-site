class LearningGoalTagAssociation < ActiveRecord::Migration[7.1]
  def change
    create_join_table :learning_goals, :tags
  end
end
