class StockPrice < ApplicationRecord
  validates_presence_of :last_price, :market_cap, :change_percent
  belongs_to :stock_symbol
  alias_attribute :symbol, :stock_symbol
end
