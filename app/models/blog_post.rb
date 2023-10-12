# frozen_string_literal: true

class BlogPost < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  validates :title,
            :user,
            :slug,
            :content,
            :summary,
            presence: true

  validates :published, inclusion: { in: [true, false] }

  validates :slug, uniqueness: true

  scope :published, -> { where(published: true) }
  scope :draft, -> { where(published: false) }

  def to_param
    slug
  end
end
