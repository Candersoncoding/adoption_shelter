class AddImageColumnToPets < ActiveRecord::Migration
  def change
    add_column :pets, :image_url, :string
  end
end
