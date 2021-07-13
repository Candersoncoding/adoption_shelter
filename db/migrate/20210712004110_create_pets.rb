class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :kind
      t.string :breed
      t.string :color
      t.integer :age
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
