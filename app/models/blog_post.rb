# frozen_string_literal: true

class BlogPost < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  validates :title,
            :user,
            :published,
            :slug,
            :content,
            presence: true

  validates :slug, uniqueness: true

  def to_param
    slug
  end
end
