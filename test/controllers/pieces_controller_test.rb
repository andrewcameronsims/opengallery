# frozen_string_literal: true

require 'test_helper'

class PiecesControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get pieces_home_url
    assert_response :success
  end

  test 'should get index' do
    get pieces_index_url
    assert_response :success
  end

  test 'should get show' do
    get pieces_show_url
    assert_response :success
  end

  test 'should get new' do
    get pieces_new_url
    assert_response :success
  end

  test 'should get edit' do
    get pieces_edit_url
    assert_response :success
  end
end
