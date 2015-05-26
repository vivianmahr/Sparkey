class CreateSparkeyPosts < ActiveRecord::Migration
  def change
    create_table :sparkey_posts do |t|
      t.string :title
      t.text :description
      t.text :vibes

      t.timestamps
    end
  end
end
