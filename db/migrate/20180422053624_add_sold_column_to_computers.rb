class AddSoldColumnToComputers < ActiveRecord::Migration
  def change
    add_column :computers, :sold, :boolean
  end
end
