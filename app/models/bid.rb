# frozen_string_literal: true

class Bid < ApplicationRecord
  belongs_to :lot

  validates :amount, numericality: {
    greater_than: 0,
    message: 'The bid amount must be greater than 0.'
  }
end
