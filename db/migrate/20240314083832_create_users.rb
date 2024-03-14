class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, comment: '用户' do |t|
      t.string :name

      t.timestamps
    end
  end
end
