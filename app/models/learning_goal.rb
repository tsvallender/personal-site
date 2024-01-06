class LearningGoal < ApplicationRecord
  belongs_to :user

  has_rich_text :description
  has_rich_text :retrospective

  validates :title, presence: true
end
