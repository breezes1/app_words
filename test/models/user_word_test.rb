# == Schema Information
#
# Table name: user_words
#
#  id               :bigint           not null, primary key
#  user_id          :bigint           not null
#  word_id          :bigint           not null
#  mastered         :boolean
#  last_reviewed_at :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "test_helper"

class UserWordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
