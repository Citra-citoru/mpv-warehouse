class Stock < ApplicationRecord
  belongs_to :group
  has_many :ins
  has_many :requisitions

  # Validations
  validates :kind, :description, :unit, :minimum_stock, :maximum_stock, :reorder_point, :status, :group, presence: true
  validates :minimum_stock, :maximum_stock, :reorder_point, :stock_balance, :average_cost, :total_cost, numericality: true

  # Enumerators
  enum kind: [:'Food and Beverages', :'Operational supplies and equipment']
  enum status: [:'Active', :'Inactive']

  # Virtual Attributes
  def to_s
    'description'
  end
end
