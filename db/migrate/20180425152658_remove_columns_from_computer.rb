class RemoveColumnsFromComputer < ActiveRecord::Migration
  def change
    remove_column :computers, :sku
    remove_column :computers, :description
  end
end
