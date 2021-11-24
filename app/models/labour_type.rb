class LabourType < ApplicationRecord
    validates :name, uniqueness: true
    has_many :labours , dependent: :restrict_with_error
end
