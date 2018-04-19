class CreateComputers < ActiveRecord::Migration
  def change
    create_table :computers do |t|
      t.integer :sku
      t.string :description
      t.string :serial
      t.date :rec_date
      t.references :school, index: true, foreign_key: true
      t.references :sale, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
