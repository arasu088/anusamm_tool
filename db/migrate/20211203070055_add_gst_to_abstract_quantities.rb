class AddGstToAbstractQuantities < ActiveRecord::Migration[6.1]
  def change
    add_column :abstract_quantities, :gst, :float
  end
end
