class ChangeStoreToDifferentTable < ActiveRecord::Migration
  def change
    remove_foreign_key :stores, :user
  end
end
