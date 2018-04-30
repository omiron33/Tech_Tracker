class AddForeignKeyToComputers < ActiveRecord::Migration
  def change
    add_reference :computers, :skulist, index:true, foreign_key: true
  end
end
