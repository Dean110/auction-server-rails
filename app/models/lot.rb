# frozen_string_literal: true

class Lot < ApplicationRecord
  has_many :bids
end
