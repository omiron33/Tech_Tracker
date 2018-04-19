class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :title
      t.string :costs
      t.date :start_date
      t.date :end_date
      t.integer :monthly_return
      t.references :school, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
