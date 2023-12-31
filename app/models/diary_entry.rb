class DiaryEntry < ApplicationRecord
  belongs_to :user
  has_many :exercises

  validates :date,
            :pain_level,
            :energy_level,
            :mental_alertness_level,
            :work_stress_level,
            :life_stress_level,
            :sleep_quality_level,
            :weight,
            presence: true

  validates :pain_level,
            :energy_level,
            :mental_alertness_level,
            :work_stress_level,
            :life_stress_level,
            :sleep_quality_level,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  validates :weight, numericality: { greater_than_or_equal_to: 0 }
end
