class LearningGoal < ApplicationRecord
  belongs_to :user

  has_rich_text :description, :retrospective

  validates :title, presence: true
end
