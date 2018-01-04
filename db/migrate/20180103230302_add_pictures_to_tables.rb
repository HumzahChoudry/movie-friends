class AddPicturesToTables < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :picture, :string
    add_column :movies, :picture, :string
  end
end
