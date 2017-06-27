class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :image_url, :default => ""
      t.string :user_id
      t.timestamps null: false
    end
  end
end
