# frozen_string_literal: true

class Micropost < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  validates :user,
            :content,
            presence: true

  has_many :microposts_tags
  has_many :tags, through: :microposts_tags

  def add_tags(*tag_names)
    tag_names.each do |tag|
      tags << Tag.find_or_create_by(name: tag)
    end
  end
end
