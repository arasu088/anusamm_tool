class AddColumnsToMaterial < ActiveRecord::Migration[6.1]
  def change
    add_column :materials, :material_type_id, :integer
    add_column :materials, :unit, :string
  end
end
