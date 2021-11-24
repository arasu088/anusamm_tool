class LabourPayment < ApplicationRecord
    belongs_to :project
    belongs_to :labour
    belongs_to :labour_type
end
