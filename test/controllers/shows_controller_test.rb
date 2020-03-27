require 'test_helper'

class ShowsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shows_new_url
    assert_response :success
  end

  test "should get create" do
    get shows_create_url
    assert_response :success
  end

  test "should get update" do
    get shows_update_url
    assert_response :success
  end

  test "should get edit" do
    get shows_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get shows_destroy_url
    assert_response :success
  end

end
