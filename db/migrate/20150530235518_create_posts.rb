class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :text_content
      t.string :image_path, limit: 100
      t.string :video_path, limit: 100
      t.integer :spark_count

      t.timestamps null: false
    end
  end
end
