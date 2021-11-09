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
        shared_examples 'failed validation - Amount Bid not high enough.' do
          it 'should fail vaidation.' do
            expect { subject }.to raise_error(ActiveRecord::RecordInvalid,
                                              /Validation failed: Amount Bid not high enough./)
          end
        end

        subject { create(:bid, amount: 1, lot: lot) }

        context 'Given a bid that is the same as the starting bid' do
          let(:lot) { create(:lot, starting_bid_amount: 1) }

          it_should_behave_like 'failed validation - Amount Bid not high enough.'
        end

        context 'Given a bid that is less than the starting bid' do
          let(:lot) { create(:lot, starting_bid_amount: 2) }

          it_should_behave_like 'failed validation - Amount Bid not high enough.'
        end

        context 'Given a bid that is less than the minimum increment' do
          let(:lot) { create(:lot, starting_bid_amount: 0.50) }

          it_should_behave_like 'failed validation - Amount Bid not high enough.'
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
