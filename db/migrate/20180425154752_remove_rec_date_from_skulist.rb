class RemoveRecDateFromSkulist < ActiveRecord::Migration
  def change
    remove_column :skulists, :rec_date
  end
end
