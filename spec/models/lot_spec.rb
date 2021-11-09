# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lot, type: :model do
  describe 'Validations:' do
    describe 'starting bid amount should' do
      it 'not be less than zero.' do
        expect { create(:lot, starting_bid_amount: -2.00) }.to raise_error(ActiveRecord::RecordInvalid,
                                                                           'Validation failed: Starting bid amount The starting bid amount must be greater than 0.')
      end
    end

    describe 'bid minimum increment should' do
      it 'not be less than zero.' do
        expect { create(:lot, minimum_bid_increment: -2.00) }.to raise_error(ActiveRecord::RecordInvalid,
                                                                             'Validation failed: Minimum bid increment The minimum bid increment must be greater than 0.')
      end
    end
  end

  describe 'Relations:' do
    #   it 'should have a Lot', :aggregate_failures do
    #     lot = Lot.create
    #     bid = Bid.create(:amount => 10.00, :lot => lot)

    #     expect(bid).to be_persisted
    #     expect(lot).to eq(bid.lot)
    #   end
  end
end
