class RemoveStockNumberFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :stock_number, :integer, default:10
  end
end
