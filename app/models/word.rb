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
class Word < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :meaning, presence: true

  belongs_to :created_by, class_name: 'User', optional: true
  has_many :user_words, dependent: :destroy
  has_many :word_book_words, dependent: :destroy
end
