class CreateGenerateurMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :générateur_messages do |t|
      t.string :role
      t.text :content
      t.references :animals, null: false, foreign_key: true

      t.timestamps
    end
  end
end
