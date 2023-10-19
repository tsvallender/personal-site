# frozen_string_literal: true

module MicropostsHelper
  def tag_string(micropost)
    micropost.tags.map(&:name).join(" ")
  end
end
