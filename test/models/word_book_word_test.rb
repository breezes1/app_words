# == Schema Information
#
# Table name: word_book_words
#
#  id           :bigint           not null, primary key
#  word_id      :bigint
#  word_book_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class WordBookWordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
