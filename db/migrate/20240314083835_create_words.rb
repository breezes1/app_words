class CreateWords < ActiveRecord::Migration[7.1]
  def change
    create_table :words, comment: '单词' do |t|
      t.string :name, null: false, index: { unique: true }, comment: '单词'
      t.string :alternate_spelling, comment: '其它拼写形式', index: true
      t.string :meaning, null: false, comment: '中文意思'
      t.string :sentence, comment: '例句'
      t.string :phonetic, comment: '音标'
      # 允许为空表示系统
      t.references :created_by, foreign_key: { to_table: :users }, comment: '创建者', index: true

      t.timestamps
    end
  end
end
