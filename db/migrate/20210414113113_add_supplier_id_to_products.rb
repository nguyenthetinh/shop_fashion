class AddSupplierIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :supplier, foreign_key: true
  end
end
