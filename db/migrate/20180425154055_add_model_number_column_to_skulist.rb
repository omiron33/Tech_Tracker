class AddModelNumberColumnToSkulist < ActiveRecord::Migration
  def change
    add_column :skulists, :model_number, :string
  end
end
