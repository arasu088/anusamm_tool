class MaterialExpense < ApplicationRecord
    belongs_to :project
    belongs_to :material
    belongs_to :supplier
end
