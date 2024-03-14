class CreateWordBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :word_books, comment: '单词本' do |t|
      t.string :name, null: false, index: { unique: true }, comment: '单词本名称'
      t.string :description, comment: '描述'
      t.integer :kind, default: 0, comment: '类型(0: 系统, 1: 用户自定义)', index: true
      # 归属用户或者为空表示系统
      t.references :user, foreign_key: true, comment: '用户'

      t.timestamps
    end
  end
end
