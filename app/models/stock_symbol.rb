class StockSymbol < ApplicationRecord
  validates_presence_of :company, :symbol
  validates :symbol, uniqueness: { scope: :company }
  before_save -> { symbol.upcase! }
  has_one :stock_price
end
