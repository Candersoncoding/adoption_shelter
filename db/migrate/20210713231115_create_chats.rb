class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :comment
      t.references :user, index: true, foreign_key: true
      t.references :pet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
