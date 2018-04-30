class RemoveSerialFromSkulist < ActiveRecord::Migration
  def change
    remove_column :skulists, :serial
  end
end
