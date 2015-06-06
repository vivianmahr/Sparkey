class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text_content
      t.string :author_name, limit: 50
      t.datetime :date_submitted

      t.timestamps null: false
    end
  end
end
