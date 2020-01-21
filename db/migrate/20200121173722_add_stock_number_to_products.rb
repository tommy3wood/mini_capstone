class AddStockNumberToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :stock_number, :integer, default: 10
  end
end
