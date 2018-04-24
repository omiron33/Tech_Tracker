class RenameLocationToStore < ActiveRecord::Migration
  def change
    rename_table :locations, :stores
  end
end
