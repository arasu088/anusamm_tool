class Labour < ApplicationRecord
    validates :name, uniqueness: true
    belongs_to :labour_type
    has_many :labour_payments, dependent: :restrict_with_error
end
