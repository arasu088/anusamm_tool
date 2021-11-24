class Material < ApplicationRecord
    validates :name, uniqueness: true
    has_many :material_expenses , dependent: :restrict_with_error
end
