class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.string :materials
      t.string :dimensions
      t.boolean :sold
      t.references :user, foreign_key: true
      t.references :workshop, foreign_key: true

      t.timestamps
    end
  end
end
