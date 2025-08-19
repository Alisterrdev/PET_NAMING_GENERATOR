class AddDescriptionToAnimal < ActiveRecord::Migration[7.1]
  def change
    add_column :animals, :description, :string
  end
end
