require 'test_helper'

class PiecesControllerTest < ActionDispatch::IntegrationTest

  test 'should get index' do
    get pieces_url
    assert_response :success
  end

  test 'should get show' do
    get piece_url(1)
    assert_response :success
  end

  test 'should get new' do
    get new_piece_url
    assert_response :success
  end

  test 'should get edit' do
    get edit_piece_url(1)
    assert_response :success
  end
end
