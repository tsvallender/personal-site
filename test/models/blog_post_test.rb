# frozen_string_literal: true

require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  setup do
    @post = blog_posts(:published)
    assert @post.valid?
  end

  test "must have a title" do
    @post.title = nil
    assert_not @post.valid?
  end

  test "must have a user" do
    @post.user = nil
    assert_not @post.valid?
  end

  test "must have a published status" do
    @post.published = nil
    assert_not @post.valid?
  end

  test "must have a slug" do
    @post.slug = nil
    assert_not @post.valid?
  end

  test "must have content" do
    @post.content = nil
    assert_not @post.valid?
  end
end
