class CreateVibes < ActiveRecord::Migration
  def change
    create_table :vibes do |t|
      t.string :vibe, limit: 20
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
