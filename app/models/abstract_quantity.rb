class AbstractQuantity < ApplicationRecord
    belongs_to :project
    belongs_to :material
    validates_uniqueness_of :material, scope: :project
end
