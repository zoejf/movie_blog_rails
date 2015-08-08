class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :movie
      t.integer :year
      t.text :quote
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
