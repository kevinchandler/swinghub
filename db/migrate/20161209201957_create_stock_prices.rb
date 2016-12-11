class CreateStockPrices < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_prices do |t|
      t.float :last_price
      t.float :market_cap
      t.float :change_percent
      t.references :stock_symbol

      t.timestamps
    end
  end
end
