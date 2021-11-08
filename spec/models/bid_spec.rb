require 'rails_helper'

RSpec.describe Bid, type: :model do
  describe 'Validations:' do
    describe 'amount should' do
      it 'not be less than or equal to zero.', :aggregate_failures do
        expect{ create(:bid, :amount => -2.00) }.to raise_error(ActiveRecord::RecordInvalid, 
          "Validation failed: Amount The bid amount must be greater than 0.")
      end
    end
  end

  describe 'Relations:' do
    it 'should have a Lot', :aggregate_failures do
      lot = create(:lot)
      bid = create(:bid, :lot => lot)

      expect(bid).to be_persisted
      expect(lot).to eq(bid.lot)
    end  
  end

end
