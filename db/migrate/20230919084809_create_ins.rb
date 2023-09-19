class CreateIns < ActiveRecord::Migration[6.1]
  def change
    create_table :ins do |t|
      t.integer :kind
      t.date :date
      t.string :number
      t.integer :document
      t.float :quantity
      t.float :price_unit
      t.float :price_total
      t.text :notes
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
