json.extract! material_expense, :id, :project_id, :material_id, :supplier_id, :date, :quantity, :amount, :gst, :total_amount, :created_at, :updated_at
json.url material_expense_url(material_expense, format: :json)
