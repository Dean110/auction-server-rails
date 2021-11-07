class BidValidator < ActiveModel::Validator
  def validate(bid)
    if bid.amount <= 0
        bid.errors.add :amount, "The bid amount must be greater than 0."
    end
  end
 end