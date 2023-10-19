# frozen_string_literal: true

class MicropostsTag < ApplicationRecord
  belongs_to :micropost
  belongs_to :tag
end
