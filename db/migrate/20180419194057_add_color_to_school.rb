class AddColorToSchool < ActiveRecord::Migration
  def change
    add_reference :schools, :color, index: true, foreign_key: true
  end
end
