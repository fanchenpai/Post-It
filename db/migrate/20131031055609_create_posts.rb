class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :url, :title, :description
      t.timestamps
    end
  end
end
