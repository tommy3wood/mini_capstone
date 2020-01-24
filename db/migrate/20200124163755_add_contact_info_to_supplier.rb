class AddContactInfoToSupplier < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :email, :string
    add_column :products, :phone_number, :string 
  end
end
