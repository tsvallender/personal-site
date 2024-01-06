module LearningGoalsHelper
  def learning_goal_completed_text(learning_goal)
    learning_goal.completed ? t(".completed") : t(".not_completed")
  end
end
