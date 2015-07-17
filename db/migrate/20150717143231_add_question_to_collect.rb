class AddQuestionToCollect < ActiveRecord::Migration
  def change
    add_column :collects, :most_fav, :string
    add_column :collects, :want_game, :string
    add_column :collects, :where_c3, :string
    add_column :collects, :shourai, :string
    add_column :collects, :kit, :string
    add_column :collects, :know, :text
  end
end
