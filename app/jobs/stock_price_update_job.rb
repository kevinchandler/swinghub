class StockPriceUpdateJob < ApplicationJob
  queue_as :default
  include HTTParty
  base_uri 'http://dev.markitondemand.com/MODApis/Api/v2/Quote?symbol='

  def perform
    StockSymbol.all.each do |stock_symbol|
      begin
        res = self.class.get(stock_symbol.symbol).deep_symbolize_keys
        next if res.nil? || res[:Error].present?
        quote = res[:StockQuote]
        sp = stock_symbol.stock_price || StockPrice.new
        sp.stock_symbol = stock_symbol
        sp.last_price = quote[:LastPrice]
        sp.market_cap = quote[:MarketCap]
        sp.change_percent = quote[:ChangePercent]
        sp.save
      rescue NoMethodError
      rescue => e
        puts stock_symbol
        puts e
      end
    end
  end
end
