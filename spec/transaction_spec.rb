require 'transaction'

describe Transaction do

  let (:account) { Transaction.new }

  it { is_expected.to respond_to(:credit_account).with(1).argument }

  it 'when a user opens an account, it should be initialized with a balance of 0' do
    expect(account.balance).to eq 0
  end

  describe '#credit_account' do
    it 'should increase my balance when i deposit money' do
      account.credit_account(100)
      expect(account.balance).to eq 100
    end
  end

end
