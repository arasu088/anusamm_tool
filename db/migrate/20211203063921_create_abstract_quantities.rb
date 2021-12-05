class CreateAbstractQuantities < ActiveRecord::Migration[6.1]
  def change
    create_table :abstract_quantities do |t|
      t.integer :project_id
      t.integer :material_id
      t.float :quantity
      t.float :amount
      t.float :total

      t.timestamps
    end
  end
end
