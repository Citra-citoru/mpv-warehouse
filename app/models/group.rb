class Group < ApplicationRecord
  has_many :stocks

  validates :name, :status, presence: true

  enum status: ["active", "inactive"]

  def to_s
    "#{name}"
  end
end
