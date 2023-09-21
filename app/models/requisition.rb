class Requisition < ApplicationRecord
  belongs_to :stock
  # Validations
  validates :kind, :date, :number, :department, :stock, presence: true
  validates :quantity, :average_cost, :total_cost, numericality: true

  # Enumerators
  enum kind: %i[Requisition Returns]
  enum department: %i[Kitchen Bar Restaurant]

  # Callback
  after_create :after_create_requisition
  after_destroy :after_destroy_requisition

  # Methods Privates
  private

  def after_create_requisition
    if kind == 'Requisition'
      update(average_cost: stock.average_cost, total_cost: (quantity * stock.average_cost))
      stock_balance = stock.stock_balance - quantity
      total_cost = stock_balance * average_cost
      stock.update(stock_balance: stock_balance, total_cost: total_cost)
    elsif update(average_cost: stock.average_cost, total_cost: (quantity * stock.average_cost))
      stock_balance = stock.stock_balance + quantity
      total_cost = stock_balance * average_cost
      stock.update(stock_balance: stock_balance, total_cost: total_cost)
    end
  end

  def after_destroy_requisition
    if kind == 'Requisition'
      stock_balance = stock.stock_balance + quantity
      total_cost = stock_balance * average_cost
      stock.update(stock_balance: stock_balance, total_cost: total_cost)
    else
      stock_balance = stock.stock_balance - quantity
      total_cost = stock_balance * average_cost
      stock.update(stock_balance: stock_balance, total_cost: total_cost)
    end
  end
end
