class ChangeSkuTypeOnSkulist < ActiveRecord::Migration
  def change
    change_column :skulists, :sku, 'string USING CAST(sku AS string)'
  end
end
