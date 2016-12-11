require 'test_helper'

class StockSymbolTest < ActiveSupport::TestCase
  test "requires company and symbol to save record" do
    symbol = StockSymbol.new
    assert symbol.save.eql? false
    symbol.symbol = 'GOOG'
    assert symbol.save.eql? false
    symbol.company = 'Google'
    assert symbol.save.eql? true
  end

  test 'it should upcase the symbol before saving' do
    symbol = StockSymbol.new
    symbol.company = 'Google'
    symbol.symbol = 'goog'
    symbol.save
    assert symbol.symbol.eql? 'GOOG'
  end
end
