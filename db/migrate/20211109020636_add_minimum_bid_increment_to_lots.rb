# frozen_string_literal: true

class AddMinimumBidIncrementToLots < ActiveRecord::Migration[6.1]
  def change
    add_column :lots, :minimum_bid_increment, :decimal
  end
end
