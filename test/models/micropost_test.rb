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

  test "can add tags" do
    assert_empty @micropost.tags
    assert_difference "@micropost.tags.count", +3 do
      @micropost.set_tags("foo", "bar", "baz")
    end
  end

  test "duplicate tags are not added" do
    assert_empty @micropost.tags
    assert_difference "@micropost.tags.count", +3 do
      @micropost.set_tags("foo", "bar", "baz")
    end
    assert_no_difference "@micropost.tags.count" do
      @micropost.set_tags("bar", "baz")
    end
  end
end
