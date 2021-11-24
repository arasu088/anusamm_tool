class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :client_name
      t.integer :number
      t.text :address
      t.float :estimated_cost

      t.timestamps
    end
  end
end
