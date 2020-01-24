class RemoveContactInfoFromProduct < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :email, :string
    remove_column :products, :phone_number, :string
  end
end
