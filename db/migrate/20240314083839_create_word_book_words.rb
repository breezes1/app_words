class CreateWordBookWords < ActiveRecord::Migration[7.1]
  def change
    create_table :word_book_words, comment: '单词表单词关联' do |t|
      t.references :word, foreign_key: true
      t.references :word_book, foreign_key: true

      t.timestamps
    end
  end
end
