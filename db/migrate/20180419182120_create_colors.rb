class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :primary
      t.string :secondary
      t.references :school, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
