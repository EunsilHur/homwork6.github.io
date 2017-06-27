class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :like_count
      t.integer :comment_id
      t.integer :post_id
      t.timestamps null: false
    end
  end
end
