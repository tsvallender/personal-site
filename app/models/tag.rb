# frozen_string_literal: true

class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :microposts_tags
  has_many :microposts, through: :microposts_tags

  def to_param
    name
  end
end
