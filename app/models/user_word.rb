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
class UserWord < ApplicationRecord
  belongs_to :user
  belongs_to :word

  before_save do
    self.last_reviewed_at = mastered? ? Time.zone.now : nil
  end
end
