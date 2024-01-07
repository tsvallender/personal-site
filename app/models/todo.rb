class Todo < ApplicationRecord
  belongs_to :learning_goal
  validates :done, inclusion: { in: [true, false] }
end
