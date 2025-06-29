class AddUniqueIndexToDirectories < ActiveRecord::Migration[8.0]
  def change
    add_index :directories, :directory, unique: true
  end
end
