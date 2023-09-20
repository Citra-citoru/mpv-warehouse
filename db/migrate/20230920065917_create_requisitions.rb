class CreateRequisitions < ActiveRecord::Migration[6.1]
  def change
    create_table :requisitions do |t|
      t.integer :kind
      t.date :date
      t.string :number
      t.integer :department
      t.decimal :quantity
      t.decimal :average_cost
      t.decimal :total_cost
      t.text :notes
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
