namespace :import do
  desc "Import stock symbols into db"
  task stock_symbols: :environment do
    symbols = YAML.load_file("db/stock_symbols.yml")
    raise 'Missing symbols file in db/stock_symbols.yml' unless symbols
    symbols['NASDAQ'].each { |company| StockSymbol.create!(company) }
    symbols['NYSE'].each { |company| StockSymbol.create!(company) }
  end
end
