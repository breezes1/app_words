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
class WordBook < ApplicationRecord
  enum kind: { system: 0, user: 1 }

  validates :name, presence: true, uniqueness: true

  belongs_to :user, optional: true
  has_many :word_book_words, dependent: :destroy
  has_many :words, through: :word_book_words
  has_many :user_words, through: :words
end
