# frozen_string_literal: true

class Micropost < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  validates :user, presence: true
  validates :content, presence: true
end
