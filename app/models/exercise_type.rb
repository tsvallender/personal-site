class ExerciseType < ApplicationRecord
  validates :name,
            :unit,
            presence: true
end
