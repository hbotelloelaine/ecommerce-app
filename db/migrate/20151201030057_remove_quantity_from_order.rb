class RemoveQuantityFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :quantity
  end
end
