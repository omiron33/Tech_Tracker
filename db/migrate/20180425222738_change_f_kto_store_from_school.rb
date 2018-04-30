class ChangeFKtoStoreFromSchool < ActiveRecord::Migration
  def up
    remove_foreign_key :computers, :school
  end
end
