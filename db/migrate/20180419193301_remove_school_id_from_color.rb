class RemoveSchoolIdFromColor < ActiveRecord::Migration
  def change
    remove_column :colors, :school_id
  end
  def add
    add_column :schools, :color_id
  end
end
