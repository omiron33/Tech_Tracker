class CreateSkulists < ActiveRecord::Migration
  def change
    create_table :skulists do |t|
      t.string :sku
      t.string :description
      t.string :serial
      t.date :rec_date

      t.timestamps null: false
    end
  end
end
