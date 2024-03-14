require "test_helper"

class WordbooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wordbooks_index_url
    assert_response :success
  end

  test "should get create" do
    get wordbooks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get wordbooks_destroy_url
    assert_response :success
  end
end
