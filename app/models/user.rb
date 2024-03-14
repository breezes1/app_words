# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :word_books, dependent: :destroy
  has_many :words, foreign_key: :created_by_id
  has_many :user_words, dependent: :destroy
end
