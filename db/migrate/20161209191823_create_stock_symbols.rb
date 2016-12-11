class CreateStockSymbols < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_symbols do |t|
      t.string :company
      t.string :symbol
    end
  end
end
