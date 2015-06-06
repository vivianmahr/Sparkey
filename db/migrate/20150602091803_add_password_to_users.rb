class AddPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password, :string, limit: 50
  end
end
