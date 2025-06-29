class CreateDirectories < ActiveRecord::Migration[8.0]
  def change
    create_table :directories do |t|
      t.references :user, null: false, foreign_key: true
      t.string :directory
      t.string :name
      t.text :bio

      t.timestamps
    end
    add_index :directories, :directory, unique: true
  end
end
