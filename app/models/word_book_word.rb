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
class WordBookWord < ApplicationRecord
  belongs_to :word
  belongs_to :word_book
end
