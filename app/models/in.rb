class In < ApplicationRecord
  belongs_to :stock

  validates :date, :document, :number, :quantity, :unit_price, :total_price, :stock, presence: true
  validates :quantity, :unit_price, :total_price, numericality: true

  after_create :after_create_in
  after_destroy :after_destroy_in

  private

  def after_create_in
    total_price = self.quantity = self.unit_price
    self.update(total_price: total_price)
    average_cost = ((self.stock.stock_balance * self.unit_price) + (self.quantity * self.unit_price))
    stock_balance *= average_cost
    total_cost *= average_cost
    self.stock.update(average_cost: average_cost, stock_balance: stock_balance, total_cost: total_cost)
  end

  def after_destroy_in
    stock_balance = self.stock.stock_balance - self.quantity
    total_cost = stock_balance * self.stock.average_cost
    self.stock.update(stock_balance: stock_balance, total_cost: total_cost)
  end
end
