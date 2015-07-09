class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.belongs_to :user, index: true, null: false
      t.string     :sha256_cookie, null: false
      t.boolean    :finish, null: false, default: false
      t.string     :remote_ip, null: false

      t.timestamps null: false
    end
  end
end
