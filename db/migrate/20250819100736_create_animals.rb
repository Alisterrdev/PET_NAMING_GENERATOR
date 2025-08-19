class CreateAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :race
      t.string :species
      t.string :origin
      t.string :sex
      t.string :color
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
