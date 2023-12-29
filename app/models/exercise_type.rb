class ExerciseType < ApplicationRecord
  validates :name,
            :unit,
            presence: true

  has_many :exercises
end
