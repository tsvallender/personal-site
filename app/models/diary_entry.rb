class DiaryEntry < ApplicationRecord
  belongs_to :user

  validates :date,
            :pain_level,
            :energy_level,
            :mental_alertness_level,
            :work_stress_level,
            :life_stress_level,
            presence: true
end
