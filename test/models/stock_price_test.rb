require 'test_helper'

class StockPriceTest < ActiveSupport::TestCase
  test "requires all attributes to be present to save record" do
    sp = StockPrice.new
    assert sp.save.eql? false
    sp.last_price = 300
    assert sp.save.eql? false
    sp.market_cap = 3000000
    assert sp.save.eql? false
    sp.change_percent = -3
    sp.stock_symbol = StockSymbol.create!(
      company: 'Alphabet, Inc.',
      symbol: 'GOOG',
    )
    assert sp.save.eql? true
  end
end
