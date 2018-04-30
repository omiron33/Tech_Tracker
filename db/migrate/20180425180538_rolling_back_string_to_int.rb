class RollingBackStringToInt < ActiveRecord::Migration
  def change
    change_column :skulists, :sku, :string
  end
end
