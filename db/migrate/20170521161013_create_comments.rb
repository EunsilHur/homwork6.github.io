class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :cuser_id
      t.text :content
      t.integer :post_id
      t.timestamps null: false
    end
  end
end