json.extract! project, :id, :name, :client_name, :number, :address, :estimated_cost, :created_at, :updated_at
json.url project_url(project, format: :json)
