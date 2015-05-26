class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name 
      t.string :password
      t.integer :sparks :default => 0
      t.integer :hmms :default => 0

      t.timestamps
    end
  end
end
