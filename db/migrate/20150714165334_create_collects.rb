class CreateCollects < ActiveRecord::Migration
  def change
    create_table :collects do |t|
      t.belongs_to :game, index: true, null: false
      t.integer :evaluation
      t.string :guest_name
      t.text :impressions
      t.string :gender
      t.integer :age
      t.string :come_from

      t.timestamps null: false
    end
  end
end
