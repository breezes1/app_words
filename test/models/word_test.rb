# == Schema Information
#
# Table name: words
#
#  id                 :bigint           not null, primary key
#  name               :string           not null
#  alternate_spelling :string
#  meaning            :string           not null
#  sentence           :string
#  phonetic           :string
#  created_by_id      :bigint
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require "test_helper"

class WordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
