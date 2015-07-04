class CreateGameAuthors < ActiveRecord::Migration
  def change
    create_table :game_authors do |t|
      t.belongs_to :game, index: true, null: false
      t.belongs_to :author, index: true, null: false

      t.timestamps null: false
    end
  end
end
