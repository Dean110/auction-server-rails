# frozen_string_literal: true

FactoryBot.define do
  factory :lot do
    starting_bid_amount { 0 }
  end

  factory :bid do
    amount { 10.0 }
    lot
  end
end
