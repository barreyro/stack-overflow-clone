class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest
      t.string :email, null: false
      t.timestamps
    end
  end
end
