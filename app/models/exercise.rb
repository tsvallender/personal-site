class Exercise < ApplicationRecord
  belongs_to :type
  belongs_to :diary_entry
end
