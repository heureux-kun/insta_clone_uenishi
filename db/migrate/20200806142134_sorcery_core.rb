class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email,            null: false

      # 暗号化パスワード
      t.string :crypted_password
      
      # 暗号化用データ
      t.string :salt

      t.timestamps                null: false
    end

    add_index :users, :email, unique: true
  end
end
