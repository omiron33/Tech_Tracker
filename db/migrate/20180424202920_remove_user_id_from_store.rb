class RemoveUserIdFromStore < ActiveRecord::Migration
  def up
    remove_column :stores, :user_id
  end
end
