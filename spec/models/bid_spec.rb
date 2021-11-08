# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bid, type: :model do
  describe 'Validations:' do
    describe 'amount should' do
      it 'not be less than or equal to zero.', :aggregate_failures do
        expect { create(:bid, amount: -2.00) }.to raise_error(ActiveRecord::RecordInvalid,
                                                              /Validation failed: Amount The bid amount must be greater than 0./)
      end

      describe 'be greater than or equal to the highest bid amount and the appropriate increment amount.' do
        context 'Given a bid that is the same as the starting bid amount'
        subject { create(:bid, amount: 1, lot: lot) }

        let(:lot) { create(:lot, starting_bid_amount: 1) }

        it 'should fail vaidation.' do
          expect { subject }.to raise_error(ActiveRecord::RecordInvalid,
                                            /Validation failed: Amount Bid not high enough./)
        end
      end
    end
  end

  describe 'ActiveRecord relations:' do
    subject { create(:bid, lot: lot) }

    let(:lot) { create(:lot) }

    it 'should have a Lot', :aggregate_failures do
      expect(subject).to be_persisted
      expect(lot).to eq(subject.lot)
    end
  end
end
