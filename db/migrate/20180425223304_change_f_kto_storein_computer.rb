class ChangeFKtoStoreinComputer < ActiveRecord::Migration
  def change
    add_reference :computers, :store, index: true, foreign_key: true
  end
end
