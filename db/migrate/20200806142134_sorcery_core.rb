class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username,         null: false

      t.string :email,            null: false

      # 暗号化パスワード
      t.string :crypted_password
      
      # 暗号化用データ
      t.string :salt

      t.timestamps                null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end
