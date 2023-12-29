class DiaryEntry < ApplicationRecord
  belongs_to :user
  has_many :exercises

  validates :date,
            :pain_level,
            :energy_level,
            :mental_alertness_level,
            :work_stress_level,
            :life_stress_level,
            presence: true
end
