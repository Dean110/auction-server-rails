class Bid < ApplicationRecord
    belongs_to :lot

    validates_with BidValidator
    validate do |bid|
        
    end
end
