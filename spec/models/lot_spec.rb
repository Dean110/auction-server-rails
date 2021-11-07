require "rails_helper"

RSpec.describe Lot, type: :model do
    describe 'Validations:' do
      describe 'starting bid amount should' do
        it 'not be less than zero.', :aggregate_failures do
        #   bid = Bid.create(:amount => -2.00)
          
        #   expect(bid).not_to be_persisted
        #   expect(bid.errors[:amount]).to include("The bid amount must be greater than 0.")
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
  