# frozen_string_literal: true

require "test_helper"

class MicropostTest < ActiveSupport::TestCase
  setup do
    @micropost = microposts(:one)
    assert @micropost.valid?
  end

  test "must have a user" do
    @micropost.user = nil
    assert_not @micropost.valid?
  end

  test "must have content" do
    @micropost.content = nil
    assert_not @micropost.valid?
  end
end
