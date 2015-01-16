class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, null: false
      t.references :article, polymorphic: true, index: true, null: false
      t.text       :body, null:false
      t.timestamps
    end
  end
end
