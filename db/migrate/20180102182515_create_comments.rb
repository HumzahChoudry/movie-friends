class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :group_movie, foreign_key: true
      t.string :content
      t.integer :vote
      t.belongs_to :parent

      t.timestamps
    end
  end
end
