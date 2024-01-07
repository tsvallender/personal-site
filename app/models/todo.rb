class Todo < ApplicationRecord
  belongs_to :learning_goal
  validates :done, inclusion: { in: [true, false] }
  has_rich_text :description
  has_one :user, through: :learning_goal
end
