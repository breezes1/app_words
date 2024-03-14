require "test_helper"

class Wordbooks::WordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wordbooks_word = wordbooks_words(:one)
  end

  test "should get index" do
    get wordbooks_words_url
    assert_response :success
  end

  test "should get new" do
    get new_wordbooks_word_url
    assert_response :success
  end

  test "should create wordbooks_word" do
    assert_difference("Wordbooks::Word.count") do
      post wordbooks_words_url, params: { wordbooks_word: {  } }
    end

    assert_redirected_to wordbooks_word_url(Wordbooks::Word.last)
  end

  test "should show wordbooks_word" do
    get wordbooks_word_url(@wordbooks_word)
    assert_response :success
  end

  test "should get edit" do
    get edit_wordbooks_word_url(@wordbooks_word)
    assert_response :success
  end

  test "should update wordbooks_word" do
    patch wordbooks_word_url(@wordbooks_word), params: { wordbooks_word: {  } }
    assert_redirected_to wordbooks_word_url(@wordbooks_word)
  end

  test "should destroy wordbooks_word" do
    assert_difference("Wordbooks::Word.count", -1) do
      delete wordbooks_word_url(@wordbooks_word)
    end

    assert_redirected_to wordbooks_words_url
  end
end
