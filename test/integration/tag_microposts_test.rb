require "test_helper"

class TagMicropostsTest < ActionDispatch::IntegrationTest
  test "tags can be added to microposts" do
    @user = users(:trevor)
    sign_in(@user)
    get new_micropost_path
    assert_response :success
    post microposts_path, params: {
      micropost: {
        content: "An interesting post",
      },
      tags: "foo bar baz",
    }
    assert_response :redirect
    follow_redirect!
    assert_includes response.body, "foo"
    assert_includes response.body, "bar"
    assert_includes response.body, "baz"
  end
end
