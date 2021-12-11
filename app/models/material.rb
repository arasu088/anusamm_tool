class Material < ApplicationRecord
    validates :name, uniqueness: {scope: [:unit, :material_type_id]}
    has_many :material_expenses , dependent: :restrict_with_error
    has_many :abstract_quantities , dependent: :restrict_with_error
    belongs_to :material_type
end
