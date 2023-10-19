# frozen_string_literal: true

class Micropost < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  validates :user,
            :content,
            presence: true

  has_many :microposts_tags
  has_many :tags, through: :microposts_tags
end
