# == Schema Information
#
# Table name: word_books
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :string
#  kind        :integer          default("system")
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class WordBookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
