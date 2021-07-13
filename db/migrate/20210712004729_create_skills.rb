class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :talent
      t.references :pet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
