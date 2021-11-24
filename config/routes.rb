Rails.application.routes.draw do
  resources :labour_payments do
    collection do
      get 'getlabour'
    end
  end
  resources :material_expenses
  resources :projects
  resources :labours
  resources :labour_types
  resources :suppliers
  resources :materials
  root to: 'main#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
