class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.integer :kind
      t.string :description
      t.string :code
      t.string :string
      t.string :unit
      t.string :penshable
      t.string :boolean
      t.float :minimum_stock
      t.float :maximum_stock
      t.float :reorder_point
      t.float :stock_balance
      t.float :average_cost
      t.float :total_cost
      t.string :account
      t.string :location
      t.integer :status
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
