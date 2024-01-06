# frozen_string_literal: true

class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :microposts_tags
  has_many :microposts, through: :microposts_tags
  has_and_belongs_to_many :learning_goals

  def to_param
    name
  end
end
