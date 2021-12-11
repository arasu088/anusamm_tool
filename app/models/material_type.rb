class MaterialType < ApplicationRecord
    validates :name, uniqueness: true
    has_many :materials , dependent: :restrict_with_error
end
