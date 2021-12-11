class AddUniqueIndexToMaterial < ActiveRecord::Migration[6.1]
  def change
    add_index :materials, [:name,:unit,:material_type_id], unique: true
  end
end
