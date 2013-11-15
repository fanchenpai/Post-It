class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.boolean :vote
      t.string :votable_type
      t.integer :votable_id
      t.timestamps
    end
  end
end
