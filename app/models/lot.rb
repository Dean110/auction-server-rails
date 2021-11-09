# frozen_string_literal: true

class Lot < ApplicationRecord
  has_many :bids

  validates :starting_bid_amount, numericality: {
    greater_than_or_equal_to: 0,
    message: 'The starting bid amount must be greater than 0.'
  }
  validates :minimum_bid_increment, numericality: {
    greater_than_or_equal_to: 0,
    message: 'The minimum bid increment must be greater than 0.'
  }

  def current_high_bid
    starting_bid_amount
  end
end
