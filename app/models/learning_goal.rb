class LearningGoal < ApplicationRecord
  belongs_to :user
  has_many :todos
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags

  has_rich_text :description
  has_rich_text :retrospective
  validates :completed, inclusion: { in: [true, false] }
  validates :title, presence: true

  scope :current, -> { where(starts_on: ..Date.today, ends_on: Date.today..) }
  scope :past, -> { where(ends_on: ..Date.today) }
  scope :future, -> { where(starts_on: Date.today..) }

  def microposts
    microposts = Micropost.none
    tags.each { |tag| microposts = microposts.or(tag.microposts) }
    microposts.uniq
  end
end
