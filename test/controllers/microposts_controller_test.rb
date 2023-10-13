require "test_helper"

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    sign_in(users(:user))
    get new_micropost_url
    assert_response :success
  end

  test "should create" do
    post_content = "<p>Just some text</p>"
    sign_in(users(:user))
    post microposts_url, params: { micropost: { content: post_content } }
    assert_response :redirect
    follow_redirect!
    assert_includes @response.body, post_content
  end
end
