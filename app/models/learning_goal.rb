class LearningGoal < ApplicationRecord
  belongs_to :user

  has_rich_text :description
  has_rich_text :retrospective

  validates :title, presence: true

  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags

  def microposts
    microposts = Micropost.none
    tags.each { |tag| microposts = microposts.or(tag.microposts) }
    microposts
  end
end
