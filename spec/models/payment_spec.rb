require 'spec_helper'

describe Payment do
  let!(:trade) { FactoryGirl.create :trade }

  describe 'self.increment_amount_or_initialize' do
    let!(:payment_attrs) { { trade_id: trade.id, amount: 10 } }

    it 'returns a Payment' do
      p = Payment.increment_amount_or_initialize(payment_attrs)

      expect(p.is_a?(Payment)).to eq(true)
    end

    it 'creates a new record if a record is not found' do
      p = Payment.increment_amount_or_initialize(payment_attrs)

      expect(p.new_record?).to eq(true)
    end

    it 'returns the matching record if found' do
      existing_payment = Payment.create(trade: trade, amount: 10)
      p = Payment.increment_amount_or_initialize(payment_attrs)

      expect(p).to eq(existing_payment)
    end

    it 'increments the amount of the matching record if found' do
      Payment.create(trade: trade, amount: 10)
      p = Payment.increment_amount_or_initialize(payment_attrs)

      expect(p.amount.to_f).to eq(20)
    end

  end
end
