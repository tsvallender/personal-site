# frozen_string_literal: true

class Micropost < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  validates :user,
            :content,
            presence: true
end
