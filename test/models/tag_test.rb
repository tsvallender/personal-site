require "test_helper"

class TagTest < ActiveSupport::TestCase
  setup do
    @tag = tags(:sql)
    assert @tag.valid?
  end

  test "must have a name" do
    @tag.name = nil
    assert_not @tag.valid?
  end
end
