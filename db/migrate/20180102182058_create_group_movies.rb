class CreateGroupMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :group_movies do |t|
      t.belongs_to :group, foreign_key: true
      t.belongs_to :movie, foreign_key: true

      t.timestamps
    end
  end
end
