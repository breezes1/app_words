# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 创建用户
user = User.create(name: 'user1')

# 创建单词 * 10
10.times do |i|
  Word.create(
    name: "word#{i}",
    meaning: "meaning#{i}",
    sentence: "sentence#{i}",
    phonetic: "phonetic#{i}"
  )
end

# 创建系统单词本，含有所有单词
system_word_book = WordBook.create!(
  name: 'system',
  kind: 'system',
  user: nil
)
system_word_book.words = Word.all
# 随机掌握 n 个单词
system_word_book.words.sample((rand * 10).to_i).each do |word|
  user.user_words.find_or_create_by!(word: word).update!(mastered: true)
end


# 创建用户单词本，随机包含 5 个单词
user_word_book = WordBook.create!(
  name: 'user_创建的单词本',
  kind: 'user',
  user: user
)
user_word_book.words = Word.all.sample(5)
# 随机掌握 3 个单词
user_word_book.words.sample((rand * 5).to_i).each do |word|
  user.user_words.find_or_create_by!(word: word).update!(mastered: true)
end
