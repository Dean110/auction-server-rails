# frozen_string_literal: true

FactoryBot.define do
  factory :lot do
  end

  factory :bid do
    amount { 10.0 }
    lot
  end
end
