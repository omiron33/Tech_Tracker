class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :teams, :user_id, :leader_id
    add_column :teams, :employee_id, :integer
  end
end
