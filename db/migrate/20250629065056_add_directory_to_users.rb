class AddDirectoryToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :directory, :string
    add_index :users, :directory, unique: true
  end
end
