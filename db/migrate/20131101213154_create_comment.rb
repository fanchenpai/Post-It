class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :user_id, :post_id
      t.timestamp
    end
  end
end
