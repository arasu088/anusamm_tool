class CreateLabourPayments < ActiveRecord::Migration[6.1]
  def change
    create_table :labour_payments do |t|
      t.integer :project_id
      t.integer :labour_type_id
      t.integer :labour_id
      t.date :date
      t.integer :amount

      t.timestamps
    end
  end
end
