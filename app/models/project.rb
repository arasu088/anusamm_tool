class Project < ApplicationRecord
    validates :name, uniqueness: true
    has_many :material_expenses , dependent: :restrict_with_error
    has_many :labour_payments , dependent: :restrict_with_error
    has_many :abstract_quantities , dependent: :restrict_with_error
end
