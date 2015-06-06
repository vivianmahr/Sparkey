class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 50
      t.string :about, limit: 300

      t.timestamps null: false
    end
  end
end
