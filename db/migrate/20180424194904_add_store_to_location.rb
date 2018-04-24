class AddStoreToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :store_number, :integer
  end
end
