class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :article, polymorphic: true, index: true
      t.boolean    :upvote
      t.timestamps
    end
  end
end
