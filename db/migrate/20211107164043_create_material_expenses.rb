class CreateMaterialExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :material_expenses do |t|
      t.integer :project_id
      t.integer :material_id
      t.integer :supplier_id
      t.date :date
      t.float :quantity
      t.float :amount
      t.float :gst
      t.float :total_amount

      t.timestamps
    end
  end
end
