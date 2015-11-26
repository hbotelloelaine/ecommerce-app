class ChangePriceToDecimalOfProdcut < ActiveRecord::Migration
  def change
    change_column :products, :price, 'decimal USING(trim(price)::decimal, presision: 6, scale: 2)'
  end
end
