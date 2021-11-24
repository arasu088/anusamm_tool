class CreateLabours < ActiveRecord::Migration[6.1]
  def change
    create_table :labours do |t|
      t.string :name
      t.integer :number
      t.boolean :is_active
      t.integer :labour_type_id

      t.timestamps
    end
  end
end
