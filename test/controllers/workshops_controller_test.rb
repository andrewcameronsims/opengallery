require 'test_helper'

class WorkshopsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get workshops_new_url
    assert_response :success
  end

  test "should get show" do
    get workshops_show_url
    assert_response :success
  end

  test "should get edit" do
    get workshops_edit_url
    assert_response :success
  end

end
