class CreateUserWords < ActiveRecord::Migration[7.1]
  def change
    create_table :user_words do |t|
      t.references :user, null: false, foreign_key: true
      t.references :word, null: false, foreign_key: true
      t.boolean :mastered
      t.datetime :last_reviewed_at

      t.timestamps
    end
  end
end
